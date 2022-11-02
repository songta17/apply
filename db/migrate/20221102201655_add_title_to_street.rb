class AddTitleToStreet < ActiveRecord::Migration[7.0]
  def change
    add_column :streets, :title, :string
  end
end
