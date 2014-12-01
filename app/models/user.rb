class User < ActiveRecord::Base
  has_many :owned_projects, class_name: 'Project'

end
