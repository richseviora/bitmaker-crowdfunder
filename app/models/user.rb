class User < ActiveRecord::Base
  has_secure_password
  has_many :owned_projects, class_name: 'Project', foreign_key: 'owner_id', inverse_of: :owner
  has_many :pledges
  has_many :projects, through: :pledges
end
