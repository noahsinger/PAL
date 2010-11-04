class Mailer < ActionMailer::Base
  default :from => "development@diverpal.com"
  
  def contact_email(contact)
    @contact = contact
    mail( :to => contact.to, :from => contact.from, :subject => contact.subject )
  end
  
  def class_request_email( class_request )
    @class_request = class_request
    mail( :to => "development@diverpal.com", :from => class_request.from, :subject => "A new class request has been submitted" )
  end
  
  def subscriber_verification( subscriber )
    @subscriber = subscriber
    mail( :to => subscriber.email, :subject => 'Please Confirm Diverpal Newsletter Subscription')
  end
end
