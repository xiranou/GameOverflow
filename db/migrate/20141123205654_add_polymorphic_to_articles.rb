class AddPolymorphicToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :voteable_id, :integer
    add_column :articles, :voteable_type, :string
  end
end
