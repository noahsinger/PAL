class SubscribersController < ApplicationController
  filter_resource_access
  
  # GET /subscribers
  # GET /subscribers.xml
  def index
    @subscribers = Subscriber.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @subscribers }
    end
  end

  # POST /subscribers
  # POST /subscribers.xml
  def create
    @subscriber = Subscriber.new(params[:subscriber])

    respond_to do |format|
      if @subscriber.save
        Mailer.delay.subscriber_verification(@subscriber)
        # Mailer.subscriber_verification(@subscriber).deliver
        format.html { redirect_to root_url, :notice => 'A confirmation email has been sent to your email address.' }
        format.xml  { render :xml => @subscriber, :status => :created, :location => @subscriber }
      else
        format.html { redirect_to root_url, :alert => @subscriber.errors.full_messages.join( ', ' ) }
        format.xml  { render :xml => @subscriber.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def verify
    @subscriber = Subscriber.find params[:id]
    
    if @subscriber.code == params[:code]
      @subscriber.verified = true
      @subscriber.save
      
      redirect_to root_url, :notice => 'Your address has been verified and you will receive our newletter the next time it\'s sent'
    else
      redirect_to root_url, :alert => 'The address you entered is not correct'
    end
  end

  # DELETE /subscribers/1
  # DELETE /subscribers/1.xml
  def destroy
    @subscriber = Subscriber.find(params[:id])
    @subscriber.destroy

    respond_to do |format|
      format.html { redirect_to(subscribers_url) }
      format.xml  { head :ok }
    end
  end
end
