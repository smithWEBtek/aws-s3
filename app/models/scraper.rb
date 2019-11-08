require 'nokogiri'
require 'open-uri'

class Scraper < ApplicationRecord

  def self.pdf
    @pdfs = []
    file = File.open(Rails.root.join('lib', 'assets', 'mapc.html'))

    doc = File.open(file) { |f| Nokogiri::HTML(f) }
    doc.css('.fl-col-content a').each do |item|

      @pdfs.push({
        title: item.values[0].split('/').last.gsub('.pdf', ''),
        image_urls: item.children[0].attributes['srcset'] ?  item.children[0].attributes["srcset"].value.split : 'no images',
        url: item.values[0],
        media_type: 'pdf',
        month_published: 'manual entry'
      })
    end
    Resource.import_resources(@pdfs)
    self.download
  end

  def self.download
    @pdfs.each do |pdf|
      download = open(pdf[:url])
      download_path = Rails.root.join("lib", "assets", "pdf", "#{pdf[:title]}.pdf")
      IO.copy_stream(download, download_path)
    end
  end
end
