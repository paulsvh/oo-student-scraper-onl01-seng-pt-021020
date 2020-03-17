require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    index = Nokogiri::HTML(open(index_url))
    students = []
    index.css("div.roster-cards-container").each do |card|
      card.css(".student-card a").each do |student|
        profile_link = "#{student.attr('href')}"
        student_ location = student.css('.student-location').text
        student_name = student.css('.student-name').text
        students << {name: student_name, location: student_location, profile_url: profile_link}
      end
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    profile = Nokogiri::HTML(open(profile_url))
    student = {}

  end

end
