require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = Nokogiri::HTML(URI.open(index_url)).css("div")#roster-cards-container" "student-card")
    binding.pry


  end

  def self.scrape_profile_page(profile_url)

  end

end
