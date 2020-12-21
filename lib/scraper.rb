require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    student_array = []
    Nokogiri::HTML(URI.open(index_url)).css("div.roster-cards-container").css("div.student-card").css("div.card-text-container").each do |student|
      student_name =  student.css("h4.student-name").text
      student_location = student.css("h4.student-location").text
      student_hash = {"name" => student_name, "location" => student_location}
      student_array << student_hash
    end
    binding.pry
    student_array
  end

  def self.scrape_profile_page(profile_url)

  end

end
