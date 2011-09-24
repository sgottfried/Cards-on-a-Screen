class AddTrashedToCards < ActiveRecord::Migration
  def change
    add_column :cards, :trashed, :boolean, :default => 0
  end
end
