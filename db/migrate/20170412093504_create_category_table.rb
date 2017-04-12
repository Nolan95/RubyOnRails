class CreateCategoryTable < ActiveRecord::Migration[5.0]
  def change
    create_table :category_tables do |t|
      t.string :title
      t.text :description
    end
  end
end
