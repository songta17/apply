class Commune < ApplicationRecord
  belongs_to :intercommunality, required: false
  has_many :streets

  validates :name, presence: true
  validates :code_insee, presence: true, length: { is: 5 }
end
