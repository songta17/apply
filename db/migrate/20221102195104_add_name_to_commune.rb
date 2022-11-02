class AddNameToCommune < ActiveRecord::Migration[7.0]
  def change
    add_column :communes, :name, :string
  end
end
