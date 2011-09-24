class AddTrashedToCards < ActiveRecord::Migration
  def change
    add_column :cards, :trashed, :boolean, :default => :false
  end
end
