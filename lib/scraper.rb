require 'open-uri'
require 'pry'

class Scraper
  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  def self.scrape_index_page(index_url)
    student_array = []
    Nokogiri::HTML(URI.open(index_url)).css("div.roster-cards-container").css("div.student-card").each do |student|
      student_name =  student.css("div.card-text-container").css("h4.student-name").text
      student_location = student.css("div.card-text-container").css("p.student-location").text
      student_profile_url = student.css("a")[0]["href"]
      student_hash = {:name => student_name, :location => student_location, :profile_url => student_profile_url}
      student_array << student_hash
    end
    student_array
  end

  def self.scrape_profile_page(profile_url)
    student_data = Nokogiri::HTML(URI.open(profile_url)).css("div.main-wrapper.profile")
    student_urls = student_data.css("div.vitals-container").css("div.social-icon-container")
    student_twitter = ""
    student_linkedin = ""
    student_github = ""
    student_blog = ""
    if student_urls.css("a")[0]
      student_twitter = student_urls.css("a")[0]["href"]
    end
    if student_urls.css("a")[1]
      student_linkedin = student_urls.css("a")[1]["href"]
    end
    if student_urls.css("a")[2]
      student_github = student_urls.css("a")[2]["href"]
    end
    if student_urls.css("a")[3]
      student_blog = student_urls.css("a")[3]["href"]
  end


    student_profile_quote = student_data.css("div.vitals-container").css("div.vitals-text-container").css("div.profile-quote").text
    student_bio = Nokogiri::HTML(URI.open(profile_url)).css("div.main-wrapper.profile").css("div.details-container").css("div.bio-block.details-block")
      .css("div.bio-content.content-holder").css("div.description-holder").css("p").text
      student_hash = {:twitter => student_twitter, :linkedin => student_linkedin, :github => student_github, :blog =>student_blog, :profile_quote => student_profile_quote, :bio => student_bio}
  end

end
