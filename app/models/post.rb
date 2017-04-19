class Post < ApplicationRecord

  #validates_with NameValidator


  include Sluggable

  belongs_to :categorie, counter_cache: true

  has_and_belongs_to_many :tags

  has_many :metas, as: :metaable

  scope :published, -> { where(online: 1) }

  scope :offline, -> (online){
    where(online: online) if online.is_a? Integer

  }


  validates :slug, format: { with: /\A[a-z0-9\-]+\z/ }, uniqueness: true


end
