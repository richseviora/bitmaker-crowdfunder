# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


if Rails.env == 'development'


  10.times do
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: '12345')
  end

  start_lower = Date.new(2014, 12, 31)
  start_upper = Date.new(2015, 5, 31)
  end_lower = Date.new(2015, 6, 1)
  end_upper = Date.new(2015, 12, 31)

  50.times do |time|
    Category.create(name: Faker::Commerce.department + time.to_s)
  end

  1000.times do
    random_user = User.offset(rand(User.count)).first
    random_category = Category.offset(rand(Category.count)).first
    Project.create(name: Faker::Commerce.product_name, description: Faker::Company.bs, start_date: Faker::Date.between(start_lower, start_upper), end_date: Faker::Date.between(end_lower, end_upper), funding_goal: Faker::Number.positive(10000, 100000), owner: random_user, category: random_category)
  end

  Project.all.each do |project|
    Faker::Number.between(1, 5).times do
      project.rewards.create(title: Faker::Commerce.product_name, description: Faker::Company.bs, amount: Faker::Number.positive(1, project.funding_goal))
    end
  end

  1000.times do
    random_user = User.offset(rand(User.count)).first
    random_reward = Reward.offset(rand(Reward.count)).first
    random_user.pledges.create(amount: random_reward.amount, reward: random_reward)
  end


end
