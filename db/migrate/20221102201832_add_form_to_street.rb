class AddFormToStreet < ActiveRecord::Migration[7.0]
  def change
    add_column :streets, :from, :integer
  end
end
