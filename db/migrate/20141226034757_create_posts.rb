class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :format
      t.string :length
      t.string :size

      t.timestamps null: false
    end
  end
end
