require 'csv'

class ImportJob < ApplicationJob
  queue_as :default

  def perform(csv)
    # Intercommunality.count
    CSV.foreach('./spec/fixtures/epcicom.csv', :headers => true, col_sep: ';', encoding: 'ISO-8859-1:UTF-8') do |row|
      if row['form_epci'] == "METRO"
        form_epci = 'met'
      else
        form_epci = row['form_epci'].downcase
      end
      if !Intercommunality.where(siren: row['siren_epci']).exists?
        Intercommunality.create!(
          siren: row['siren_epci'],
          name: row['nom_complet'],
          form: form_epci
        )
      end
      Commune.create!(
        code_insee: row['insee'],
        name: row['nom_com'],
        population: row['pop_total']
      )
    end
  end
end
