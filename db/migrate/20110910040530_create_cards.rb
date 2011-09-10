class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :top
      t.integer :left
      t.string :text

      t.timestamps
    end
  end
end
