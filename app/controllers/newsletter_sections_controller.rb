class NewsletterSectionsController < ApplicationController
  filter_resource_access :additional_collection => [:reorder]
  
  before_filter :load_newsletter
  
  def load_newsletter
    @newsletter = Newsletter.find params[:newsletter_id]
  end
  
  # GET /newsletter_sections/new
  # GET /newsletter_sections/new.xml
  def new
    @newsletter_section = @newsletter.newsletter_sections.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @newsletter_section }
    end
  end

  # GET /newsletter_sections/1/edit
  def edit
    @newsletter_section = @newsletter.newsletter_sections.find(params[:id])
  end
  
  def reorder
    @newsletter_sections = @newsletter.newsletter_sections.all
  end

  # POST /newsletter_sections
  # POST /newsletter_sections.xml
  def create
    @newsletter_section = @newsletter.newsletter_sections.build(params[:newsletter_section])

    respond_to do |format|
      if @newsletter_section.save
        format.html { redirect_to(@newsletter, :notice => 'Newsletter section was successfully created.') }
        format.xml  { render :xml => @newsletter_section, :status => :created, :location => @newsletter_section }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @newsletter_section.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /newsletter_sections/1
  # PUT /newsletter_sections/1.xml
  def update
    @newsletter_section = @newsletter.newsletter_sections.find(params[:id])

    respond_to do |format|
      if @newsletter_section.update_attributes(params[:newsletter_section])
        format.html { redirect_to(@newsletter, :notice => 'Newsletter section was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @newsletter_section.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /newsletter_sections/1
  # DELETE /newsletter_sections/1.xml
  def destroy
    @newsletter_section = @newsletter.newsletter_sections.find(params[:id])
    @newsletter_section.destroy

    respond_to do |format|
      format.html { redirect_to(@newsletter) }
      format.xml  { head :ok }
    end
  end
end
