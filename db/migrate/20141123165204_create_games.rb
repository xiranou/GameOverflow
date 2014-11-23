class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title

      t.references :genre
      t.references :console

      t.timestamps
    end
  end
end
