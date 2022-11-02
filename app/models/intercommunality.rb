class Intercommunality < ApplicationRecord
  has_many :communes

  validates :name, presence: true
  validates :siren, presence: true,
                  uniqueness: { case_sensitive: false },
                  length: { is: 9 }
  validates :form, inclusion: { in: %w(ca cu cc met) }

  before_save :set_slug

  def communes_hash
    communes_hash = {}
    communes.each do |commune|
      communes_hash[commune.code_insee.to_s] = commune.name
    end
    communes_hash
  end

  def set_slug
    self.slug = name.parameterize if !name.nil? && self.slug.nil?
  end
  

  # Failure/Error: Commune.create!(code_insee: "34172", intercommunality: interco, name: "Montpellier")
     
  # ActiveRecord::NotNullViolation:
  #   SQLite3::ConstraintException: NOT NULL constraint failed: communes.street_id
end
