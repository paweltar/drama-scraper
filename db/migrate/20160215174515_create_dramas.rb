class CreateDramas < ActiveRecord::Migration
  def change
    create_table :dramas do |t|
      t.string :url
      t.string :title
      t.boolean :subbed
      t.datetime :broadcasted_at
      t.text :description
      t.string :img

      t.timestamps null: false
    end
  end
end
