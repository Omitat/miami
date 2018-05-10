class RenameAboutImgMainColumnToImage < ActiveRecord::Migration[5.2]
  def change
    rename_column :abouts, :imgMain, :image

    remove_column :abouts, :gallery
  end
end
