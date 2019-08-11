class SitesController < ApplicationController
  # This allows any user to see all sites, update it so they can see only their sites
  skip_before_action :authenticate_user!, only: [:index]

  def index
    # Where is @ZR_USER coming from? It's set in the lib/zerista library as an instance variable
    if !@ZR_USER
      # This should redirect to force the user to login
      redirect_to '/users/sign_in'
    elsif
      # Update to only load site for the current @ZR_USER
      @sites = Site.where(user: @ZR_USER.id)
    end

    @sites
  end

  def show
    # Hitting this route throws an error. This route should navigate to a show page for @ZR_SITE
    # @ZR_SITE
    @site = Site.find(params[:id])
    @page = Page.new
  end

  def create
    @site = Site.create(site_params.merge(user_id: @ZR_USER.id))
    flash[:alert] = "Site Error: #{@site.errors.full_messages.join(', ')}" unless @site.persisted?
    redirect_to root_path
  end

  #Udpate is triggered by a js function located in application.js that submits the form on keypress.
  #On submit, we find the record, and update attributes. If the user leaves a field blank, a
  #alert notifies the user the data wasn't saved.

  def update
    @site = Site.find(params[:id])
    if @site.update_attributes(site_params)
      respond_to do |f|
        f.js { flash.now[:notice] = "Site info has been updated!" }
      end
    else
      flash.now[:alert] = "Error: Required filed, data has not been saved."

    end
  end

  # Delete method should respond with JSON
  # Retmote call fires destroy, finds the record, if the record is present, delete the record and reposond
  # through the destroy.js.erb file.
  def destroy
    @site = Site.find(params[:id])
    if @site.present?
      @site.destroy
    end
    respond_to do |format|
      format.js { render :layout => false, notice: 'Site was successfully destroyed.'}
    end
  end

  private
  #updated site params to allow for page association
  def site_params
    params.require(:site).permit(:name, :domain, :description, :id, page: [:name, :path, :header, :body, :photo, :photo_cache])
  end
end
