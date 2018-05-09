class AddSongidAndSongNameToConvoTable < ActiveRecord::Migration[5.2]
  def change
    add_column :conversations, :song_id, :text
    add_column :conversations, :song_name, :text
    add_column :conversations, :album_img_url, :text
  end
end
