class AddCategoryToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :categorie, foreign_key: true
  end
end
