class Intercommunality < ApplicationRecord
  has_many :communes

  validates :name, presence: true
  validates :siren, presence: true,
                  uniqueness: { case_sensitive: false },
                  length: { is: 9 }
  validates :form, inclusion: { in: %w(ca cu cc met) }

  before_save :set_slug

  require 'csv'

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

  # NoMethodError:
  #   undefined method `population' for #<Intercommunality id: 2, created_at: 
  #   "2022-11-07 22:59:54.483742000 +0000", updated_at: "2022-11-07 22:59:54.483742000 
  #   +0000", name: "Montpellier Méditerranée Métropole", form: "met", siren: "243400017", slug: "montpellier-mediterranee-metropole">
  
  # def population
  #   binding.pry
  #   # Intercommunality Communes "population"
  #   # sum
  # end
end
