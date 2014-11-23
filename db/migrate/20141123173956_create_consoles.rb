class CreateConsoles < ActiveRecord::Migration
  def change
    create_table :consoles do |t|
      t.string :name

      t.timestamps
    end
  end
end
