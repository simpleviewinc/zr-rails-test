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
      @sites = Site.all
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

  # Missing delete method
  # Delete method should respond with JSON

  private

  def site_params
    params.require(:site).permit(:name, :domain, :description, :id)
  end
end
