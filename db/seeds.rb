# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u = User.create(first_name: 'Rich', last_name: 'Seviora', email: 'richard.seviora@gmail.com', password: 'bob')

p = Project.new
p.name = 'Bob'
p.description = 'Desc'
p.start_date = Date.new(2014,12,12)
p.end_date = Date.new(2014,12,31)
p.funding_goal = 50000
p.owner = u
p.save

reward = Reward.create(title: 'First Reward', description: 'description here', amount: 10, project: Project.first)
pledge = Pledge.create(amount: 10, reward: Reward.first, user: User.first)
