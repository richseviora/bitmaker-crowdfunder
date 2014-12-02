class Project < ActiveRecord::Base
  has_many :rewards

  # added below line so rewards will show up in edit page. without this line the nested form in the projects/edit.html.erb  for the rewards will be blank.
  accepts_nested_attributes_for :rewards, :reject_if => :all_blank, :allow_destroy => true

  belongs_to :owner, class_name: 'User', inverse_of: :owned_projects
  has_many :pledges, through: :rewards
end