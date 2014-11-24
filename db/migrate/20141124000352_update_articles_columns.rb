class UpdateArticlesColumns < ActiveRecord::Migration
  def change
    add_column :articles, :genre_id, :integer
    add_column :articles, :game_id, :integer
    add_column :articles, :console_id, :integer
  end
end
