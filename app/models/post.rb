class Post < ApplicationRecord

  #validates_with NameValidator


  include Sluggable

  scope :published, -> { where(online: 1) }

  scope :offline, -> { where(online: 0) }


  validates :slug, format: { with: /\A[a-z0-9\-]+\z/ }, uniqueness: true


end
