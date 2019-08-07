class Site < ApplicationRecord
  belongs_to :user

  has_many :pages
  
  validates_presence_of :name, :description, :domain, :user
  
  # No method to remove a site
  
end
