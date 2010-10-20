class Mailer < ActionMailer::Base
  default :from => "development@diverpal.com"
  
  def contact_email(contact)
    mail( :to => contact.to, :from => contact.from, :subject => contact.subject )
  end
end
