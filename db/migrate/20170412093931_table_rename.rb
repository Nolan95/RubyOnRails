class TableRename < ActiveRecord::Migration[5.0]
  def change
    rename_table :category_tables, :categories
  end
end
