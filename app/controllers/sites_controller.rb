class SitesController < ApplicationController
  # This allows any user to see all sites, update it so they can see only their sites
  skip_before_action :authenticate_user!, only: [:index]

  def index
    # Where is @ZR_USER coming from?
    if !@ZR_USER
      # This should redirect to force the user to login
      @sites = []
    elsif
      # Only load sites for the current @ZR_USER
      @sites = Site.where(user: @ZR_USER.id)
    end

    @sites
  end

  def show
    # Hitting this route throws an error. This route should navigate to a show page for @ZR_SITE
    @ZR_SITE
  end

  def create
    @site = Site.create(site_params.merge(user_id: @ZR_USER.id))
    flash[:alert] = "Site Error: #{@site.errors.full_messages.join(', ')}" unless @site.persisted?
    redirect_to root_path
  end

  # Added destroy method for deleting sites.
  def destroy
      @site = Site.find(params[:id])
      @site.destroy if @site.present?
      respond_to do |format|
        format.js { render :layout => false }
        format.html { redirect_to sites_url,
                      notice: 'Site successfully deleted.' }
      end
    end

  private

  def site_params
    params.require(:site).permit(:name, :domain, :description, :id)
  end
end
