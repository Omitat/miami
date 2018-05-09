class CreateAbouts < ActiveRecord::Migration[5.2]
  def change
    create_table :abouts do |t|
      t.string :imgMain
      t.string :text
      t.string :gallery

      t.timestamps
    end
  end
end
