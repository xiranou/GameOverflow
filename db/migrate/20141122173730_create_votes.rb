class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :voter
      t.references :voteable, polymorphic: true
      t.timestamps
    end
  end
end
