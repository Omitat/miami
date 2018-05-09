class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.string :img
      t.string :title
      t.string :url
      t.text :description

      t.timestamps
    end
  end
end
