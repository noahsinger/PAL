ActionMailer::Base.smtp_settings = {
  :address              => "mail.diverpal.com",
  :port                 => 25,
  :domain               => "diverpal.com",
  :user_name            => "development@diverpal.com",
  :password             => "t35tt35t",
  :authentication       => :login,
  :enable_starttls_auto => false
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"