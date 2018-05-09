class RenameProgramsImgColumnToImage < ActiveRecord::Migration[5.2]
  def change
    rename_column :programs, :img, :image
  end
end
