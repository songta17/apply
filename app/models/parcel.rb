class Parcel < ApplicationRecord
  module NUMBER_REGEXP
    WITH_PREFIX = /(?<prefix>\d{3})\s(?<section>[A-Z0-9]{2})\s(?<plan>\d{4})/
    WITHOUT_PREFIX = /(?<prefix>\s)(?<section>[A-Z]{2})\s(?<plan>\d{4})/
    # OK2 = /\s(?<section>[A-Z]{2})\s(?<plan>\d{4})/
    # PREFIX = /\A\z/
    # SECTION = /(?<section>[A-Z0-9]{2})/
    # PLAN = /(?<plan>\d{4})/

    def self.match(str)
      # binding.pry
      # str.match OK if str.split(" ")


      str_item_number = str.split(' ')
      # 127 DC 1207
      if str_item_number.size == 3
        str.match WITH_PREFIX
      elsif str_item_number.size == 2
        a = str_item_number.unshift('')
        # binding.pry
        a.join(' ').match WITHOUT_PREFIX
      end

      # a.match PREFIX
      # a.match SECTION
      # a.match PLAN
      # str.match OK2
    end

  end

  Parcel::NUMBER_REGEXP
  
end