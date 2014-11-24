class AddVoteCountToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :vote_count, :integer
  end
end
