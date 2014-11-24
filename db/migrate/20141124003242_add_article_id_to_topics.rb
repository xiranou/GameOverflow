class AddArticleIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :article_id, :integer
  end
end
