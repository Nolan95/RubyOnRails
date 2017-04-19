class CreateMeta < ActiveRecord::Migration[5.0]
  def change
    create_table :metas do |t|
      t.string :name
      t.references :metaable, polymorphic: true, index: true
    end
  end
end
