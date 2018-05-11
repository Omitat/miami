class AddDescriptionColumnToNews < ActiveRecord::Migration[5.2]
  def change
    add_column :news,
               :description,
               :text
  end
end
