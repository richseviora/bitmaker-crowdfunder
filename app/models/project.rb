class Project < ActiveRecord::Base
  has_many :rewards
  belongs_to :owner, class_name: 'User'
end