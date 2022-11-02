class ChangeIntercommunalityIdNullToCommune < ActiveRecord::Migration[7.0]
  def change
    change_column_null :communes, :intercommunality_id, true
  end
end
