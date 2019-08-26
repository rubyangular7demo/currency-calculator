require 'open-uri'
require 'nokogiri'

class RateUpdater

  def self.parse_currencies_from_xml
    return if rates.nil?
    nori = Nori.new
    hash = nori.parse(rates.to_s)
    update_currencies(hash)
  end

  def self.update_currencies(hash)
    # sorry for that 'Cube' repetition, but this is how the ECB xml is constructed
    hash['gesmes:Envelope']['Cube']['Cube']['Cube'].each do |currency|
      c = Currency.find_or_create_by(name: currency['@currency'])
      c.rate = currency['@rate'].to_f * 100
      c.save!
    end
  end

  def self.rates
    @rates ||= Nokogiri::XML(open('http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml'))
  end

end
