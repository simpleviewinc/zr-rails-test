class ZRActionControllerBase < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :get_data
  
  private
  
  def get_data
    get_user
    get_site params[:controller]
    get_page params[:controller]
  end
  
  # Get the authenticated user
  def get_user
    self.instance_variable_set(:@ZR_USER, current_user)
  end
  
  # Get the current site base on the passed in params
  def get_site(controller)
    site = nil
    begin
      site_id = nil
      if controller == 'sites'
        site_id = params[:id]
      else
        site_id = params[:site_id]
      end
      site = Site.find({ id: site_id })
    rescue StandardError => e
    end
    
    self.instance_variable_set(:@ZR_SITE, site)

    return site
  end
  
  # Get the current page base on the passed in params
  def get_page(controller)
    page = nil
    begin
      page_id = nil
      if controller == 'pages'
        page_id = params[:id]
      else
        page_id = params[:page_id]
      end
      page = Page.find({ id: page_id })
    rescue StandardError => e
    end

    self.instance_variable_set(:@ZR_PAGE, page)
    
    return page
  end
  
end
