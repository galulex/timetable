ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "timetable.com",
  :user_name            => "social.timetable@gmail.com",
  :password             => "TimeTable2012",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
