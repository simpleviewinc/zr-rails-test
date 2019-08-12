class Site < ApplicationRecord
  belongs_to :user

  has_many :pages, dependent: :destroy

  accepts_nested_attributes_for :pages, allow_destroy: true

  validates_presence_of :name, :description, :domain, :user

  # before_destroy :destroy_pages

 private

 # def destroy_pages
 #   self.pages.destroy_all
 # end

end
