class UserMailer < ActionMailer::Base
  default :from => "administration@timetable.com"

  def invite(user)
    @token = user.token
    mail(:to => user.email, :subject => "TimeTable Invitation")
  end

end
