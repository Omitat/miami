class RenameNewsImgColumnToImage < ActiveRecord::Migration[5.2]
  def change
    rename_column :news, :img, :image
  end
end
