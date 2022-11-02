class Commune < ApplicationRecord
  belongs_to :intercommunality, required: false
  has_many :streets

  validates :name, presence: true
  validates :code_insee, presence: true, length: { is: 5 }

  require 'csv'

  def self.to_hash
    communes_hash = {}
    Commune.all.each do |commune|
      communes_hash[commune.code_insee.to_s] = commune.name
    end
    communes_hash
  end

  def self.search(search)
    Commune.where("name LIKE ?", "%#{sanitize_sql_like(search.downcase)}%")
  end

  def self.to_csv
    attributes = %w(code_insee name)

    CSV.generate(headers: true, col_sep: ';') do |csv|
      csv << attributes

      Commune.all.each do |commune|
        csv << attributes.map { |attr| commune.send(attr) } 
      end
    end
  end
end
