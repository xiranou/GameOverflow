class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.references :discussable, polymorphic: true
    end
  end
end
