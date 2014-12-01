class Project < ActiveRecord::Base
  has_many :rewards
  belongs_to :owner, class_name: 'User', inverse_of: :owned_projects
  has_many :pledges, through: :rewards
end