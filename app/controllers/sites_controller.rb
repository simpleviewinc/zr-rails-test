class SitesController < ApplicationController
  # This allows any user to see all sites, update it so they can see only their sites
  skip_before_action :authenticate_user!, only: [:index]

  def index
    # Where is @ZR_USER coming from?
    if !@ZR_USER
      # This should redirect to force the user to login
      @sites = []
      redirect_to '/users/sign_in'
    elsif
      # Only load sites for the current @ZR_USER
      @sites = Site.where(user: @ZR_USER.id)
    end

    @sites
  end

  def show
    # fleshed out a show method with some flavor.
    @site = Site.find(params[:id])
    @page = Page.new
    @factors = (1..@site.id).filter{ |d| @site.id % d == 0 }
                            .map(&:to_s).join(" and ")
  end

  def edit
    @site = Site.find(params[:id])
    render :edit
  end

   def update
    @site = Site.find(params[:id])
    @site.update_attributes(site_params) || @site.new([site_params])
    redirect_to site_path(params[:id])
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
    end

  private

  def site_params
    params.require(:site).permit(:name, :domain, :description, :id)
  end
end
