class AddToToStreet < ActiveRecord::Migration[7.0]
  def change
    add_column :streets, :to, :integer
  end
end
