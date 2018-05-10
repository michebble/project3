class CreateRemoveParticipantsTableAndAddPairedUserIdConvIdColumnsToSearches < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :paired_user_id, :integer
    add_reference :searches, :conversations, foreign_key: true
    drop_table :participants
  end
end
