class UserMailer < ActionMailer::Base
  default from: "from@crowdfunder.com"

  # adding a method that will send email to user's registered email address
  # anything that you want used in the email should be should be passed into this method
  def goal_met_email(user, project)
    @user = user
    @project = project
    @url  = 'http://example.com/login' # what is url
    mail(to: @user.email, subject: "#{project.name} has reached its funding goal. Yay!")
  end
end