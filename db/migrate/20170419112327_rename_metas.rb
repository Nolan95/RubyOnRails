class RenameMetas < ActiveRecord::Migration[5.0]
  def change

    rename_table :metas, :meta

  end
end
