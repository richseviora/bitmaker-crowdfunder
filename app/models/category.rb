class Category < ActiveRecord::Base
  has_many :projects
  validates_uniqueness_of :name
end
