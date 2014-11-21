class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.references :article
      t.references :commenter

      t.timestamps
    end
  end
end
