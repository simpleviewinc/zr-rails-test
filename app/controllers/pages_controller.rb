class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  # Respond with JSON
  def index
    @pages = Page.all
  end

  # Respond with JSON
  def create
    # Add code to create a new page
  end

  # Show method should respond with HTML or JSON
  def show
    @ZR_PAGE
  end

  private

  def page_params
    # Add the allowed page params
  end
end
