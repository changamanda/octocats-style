# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'

class StudentScraper

  def initialize
    doc = Nokogiri::HTML(open("http://web0415.students.flatironschool.com/"))
    doc.css('.home-blog-post').each do |student_doc|
      name = student_doc.css('h3').text.strip
      tagline = student_doc.css('.excerpt').text.strip
      image_url = "http://web0415.students.flatironschool.com/#{student_doc.css('img').attr('src').value}"
      Student.create(name: name, tagline: tagline, image_url: image_url)
    end
  end

end

StudentScraper.new