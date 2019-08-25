class Page < ApplicationRecord
  belongs_to :site
  belongs_to :user, optional: true

  validates_presence_of :name, :path, :header, :body, :photo, :site

  mount_uploader :photo, PhotoUploader
end
