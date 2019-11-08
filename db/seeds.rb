def import_resources
  Resource.import_resources
end

def create_calendar_tag
  Tag.create(title: 'calendar')
end

def scrape_pdfs
  Scraper.pdf
end

def main
  create_calendar_tag
  scrape_pdfs
  # import_resources
end

main
