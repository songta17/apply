class ChangeStreetIdNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :communes, :street_id, true
  end
end
