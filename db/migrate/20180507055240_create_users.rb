class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :spotify_auth
      t.text :name
      t.text :img_url
      t.integer :user_id

      t.timestamps
    end
  end
end
