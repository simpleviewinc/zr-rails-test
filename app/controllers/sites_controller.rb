class SitesController < ApplicationController
  # This allows any user to see all sites, update it so they can see only their sites
  skip_before_action :authenticate_user!, only: [:index]

  def index
    # Where is @ZR_USER coming from?
    if !@ZR_USER
      # This should redirect to force the user to login
      @sites = []
    elsif
      # Update to only load site for the current @ZR_USER
      p @ZR_USER.id
      @sites = Site.where(user: @ZR_USER.id)
    end

    @sites
  end

  def show
    # Hitting this route throws an error. This route should navigate to a show page for @ZR_SITE
    @ZR_SITE
    @site = Site.find(params[:id])

    @page = Page.new

  end

  def create
    @site = Site.create(site_params.merge(user_id: @ZR_USER.id))
    flash[:alert] = "Site Error: #{@site.errors.full_messages.join(', ')}" unless @site.persisted?
    redirect_to root_path
  end

  def update
   @site = Site.find(params[:id])

   @site.update_attributes(site_params) || @site.new([site_params])

   respond_to do |f|
     f.js {flash[:notice] = "New data saved!"}
   end
 end

  # Missing delete method
  def destroy
    @site = Site.find(params[:id])

    if @site.present?
      @site.destroy
    end
    respond_to do |format|
      format.js { render :layout => false, notice: 'Site was successfully destroyed.'}
      format.html { redirect_to sites_url, notice: 'Site was successfully destroyed.' }

    end
  end


  # Delete method should respond with JSON

  private

  def site_params

    params.require(:site).permit(:name, :domain, :description, :id, page: [:name, :path, :header, :body, :photo, :photo_cache])
  end
end
