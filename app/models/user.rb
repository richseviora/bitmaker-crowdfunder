class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :owned_projects, class_name: 'Project', foreign_key: 'owner_id', inverse_of: :owner
  has_many :pledges
  has_many :projects, through: :pledges

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email
end
