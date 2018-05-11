class ChangeImagetoImginNews < ActiveRecord::Migration[5.2]
  def change
      rename_column :news, :image, :img
  end
end
