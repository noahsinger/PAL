class CertificationLevelsController < ApplicationController
  # GET /certification_levels
  # GET /certification_levels.xml
  def index
    @certification_levels = CertificationLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @certification_levels }
    end
  end

  # GET /certification_levels/1
  # GET /certification_levels/1.xml
  def show
    @certification_level = CertificationLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @certification_level }
    end
  end

  # GET /certification_levels/new
  # GET /certification_levels/new.xml
  def new
    @certification_level = CertificationLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @certification_level }
    end
  end

  # GET /certification_levels/1/edit
  def edit
    @certification_level = CertificationLevel.find(params[:id])
  end

  # POST /certification_levels
  # POST /certification_levels.xml
  def create
    @certification_level = CertificationLevel.new(params[:certification_level])

    respond_to do |format|
      if @certification_level.save
        format.html { redirect_to(@certification_level, :notice => 'Certification level was successfully created.') }
        format.xml  { render :xml => @certification_level, :status => :created, :location => @certification_level }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @certification_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /certification_levels/1
  # PUT /certification_levels/1.xml
  def update
    @certification_level = CertificationLevel.find(params[:id])

    respond_to do |format|
      if @certification_level.update_attributes(params[:certification_level])
        format.html { redirect_to(@certification_level, :notice => 'Certification level was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @certification_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /certification_levels/1
  # DELETE /certification_levels/1.xml
  def destroy
    @certification_level = CertificationLevel.find(params[:id])
    @certification_level.destroy

    respond_to do |format|
      format.html { redirect_to(certification_levels_url) }
      format.xml  { head :ok }
    end
  end
end
