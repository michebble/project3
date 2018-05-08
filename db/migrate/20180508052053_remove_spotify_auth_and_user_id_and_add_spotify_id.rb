class RemoveSpotifyAuthAndUserIdAndAddSpotifyId < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :spotify_auth, :text
    remove_column :users, :user_id, :integer
    add_column :users, :spotify_id, :text 
  end
end
