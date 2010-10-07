class CertificationsController < ApplicationController
  filter_resource_access

  # GET /certifications
  # GET /certifications.xml
  def index
    @certifications = Certification.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @certifications }
    end
  end

  # GET /certifications/new
  # GET /certifications/new.xml
  def new
    @certification = Certification.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @certification }
    end
  end

  # GET /certifications/1/edit
  def edit
    @certification = Certification.find(params[:id])
  end

  # POST /certifications
  # POST /certifications.xml
  def create
    @certification = Certification.new(params[:certification])

    respond_to do |format|
      if @certification.save
        format.html { redirect_to(certification_sections_url(@certification), :notice => 'Certification was successfully created.') }
        format.xml  { render :xml => @certification, :status => :created, :location => @certification }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @certification.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /certifications/1
  # PUT /certifications/1.xml
  def update
    @certification = Certification.find(params[:id])

    respond_to do |format|
      if @certification.update_attributes(params[:certification])
        format.html { redirect_to(certification_sections_url(@certification), :notice => 'Certification was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @certification.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /certifications/1
  # DELETE /certifications/1.xml
  def destroy
    @certification = Certification.find(params[:id])
    @certification.destroy

    respond_to do |format|
      format.html { redirect_to(certifications_url) }
      format.xml  { head :ok }
    end
  end
end
