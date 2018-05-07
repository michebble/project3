class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.text :song_id
      t.text :song_name
      t.text :artist
      t.text :album
      t.text :img_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
