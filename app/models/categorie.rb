class Categorie < ApplicationRecord

  has_many :posts

  has_many :metas, as: :metaable

end
