class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:search].present? # Search for /pages
      @pages = search_query
    elsif params[:site_id].blank? # when user is viewing pages
      @pages = Page.where(user: @ZR_USER.id)
    else
      # eager load pages for less queries.
      @site = Site.where(id: params[:site_id])
              .includes(:pages).first
      @pages = @site.pages
    end

    respond_to do |format|
      format.html
      format.json { render json: @pages }
    end
  end

  def create
    Page.create(page_params.merge(site_id: params[:site_id]))
    redirect_to site_path(params[:site_id])
  end

  def show
    @page = Page.find(params[:id])
    @site = @page.site
    respond_to do |format|
      format.html
      format.json { render json: @page }
     end
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

  def search_query
    pages = Page.arel_table
    query = "%#{params[:search]}%"
    Page.where(pages[:name].matches(query))
  end

  def page_params
    params.require(:page).permit(:name, :path, :header, :body, :user,
                                 :photo_cache, :photo, :site_id)
  end
end
