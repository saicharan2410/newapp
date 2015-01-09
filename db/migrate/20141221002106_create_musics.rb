class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :name
      t.string :format
      t.string :length
      t.string :size

      t.timestamps null: false
    end
  end
end
