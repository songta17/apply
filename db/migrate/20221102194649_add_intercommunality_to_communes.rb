class AddIntercommunalityToCommunes < ActiveRecord::Migration[7.0]
  def change
    add_reference :communes, :intercommunality, null: false, foreign_key: true
  end
end
