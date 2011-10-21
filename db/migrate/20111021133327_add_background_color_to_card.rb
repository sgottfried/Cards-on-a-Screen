class AddBackgroundColorToCard < ActiveRecord::Migration
  def change
    add_column :cards, :background_color, :string
  end
end
