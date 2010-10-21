class ClassRequestsController < ApplicationController
  # GET /class_requests
  # GET /class_requests.xml
  def index
    @class_requests = ClassRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @class_requests }
    end
  end

  # GET /class_requests/1
  # GET /class_requests/1.xml
  def show
    @class_request = ClassRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @class_request }
    end
  end

  # GET /class_requests/new
  # GET /class_requests/new.xml
  def new
    @certification = Certification.find params[:certification_id]
    @class_request = ClassRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @class_request }
    end
  end

  # GET /class_requests/1/edit
  def edit
    @class_request = ClassRequest.find(params[:id])
  end

  # POST /class_requests
  # POST /class_requests.xml
  def create
    @class_request = ClassRequest.new(params[:class_request])

    respond_to do |format|
      if @class_request.save
        format.html { redirect_to(certification_sections_url(@class_request.certification), :notice => 'Your class request was successfully sent.') }
        format.xml  { render :xml => @class_request, :status => :created, :location => @class_request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @class_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /class_requests/1
  # PUT /class_requests/1.xml
  def update
    @class_request = ClassRequest.find(params[:id])

    respond_to do |format|
      if @class_request.update_attributes(params[:class_request])
        format.html { redirect_to(@class_request, :notice => 'Class request was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @class_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /class_requests/1
  # DELETE /class_requests/1.xml
  def destroy
    @class_request = ClassRequest.find(params[:id])
    @class_request.destroy

    respond_to do |format|
      format.html { redirect_to(class_requests_url) }
      format.xml  { head :ok }
    end
  end
end
