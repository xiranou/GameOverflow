class AddVoterIdToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :voter_id, :integer
  end
end
