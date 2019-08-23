class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  # Respond with JSON
  def index
    @pages = Page.where(user: @ZR_USER.id)
  end

  # Respond with JSON
  def create
    # Add code to create a new page
    Page.create(page_params.merge(site_id: params[:site_id]))
    redirect_to site_path(params[:site_id])
  end

  # Show method should respond with HTML or JSON
  def show
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    @site = Site.find(params[:page][:site_id])
    @page.update_attributes(page_params) || @page.new([page_params])
    redirect_to site_path(@site[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy if @page.present?
    redirect_to site_path(@page.site[:id])
  end


  private

  def page_params
    # Add the allowed page params
    params.require(:page).permit(:name, :path, :header, :body,
                                 :photo_cache, :photo, :site_id)
  end
end
