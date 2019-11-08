class Resource < ApplicationRecord
  has_many :resource_tags
  has_many :tags, through: :resource_tags
  has_many :images
  has_one_attached :featured_image

  def self.import_resources(resources)
    resources.each do |resource|
      title = resource[:title]
      image_urls = resource[:image_urls]
      url = resource[:url]
      media_type = resource[:media_type]
      month_published = resource[:month_published] ? resource[:month_published] : 'no month_published'
      year_published = resource[:year_published] ? resource[:year_published] : 'no year_published'
      description = resource[:description] ? resource[:description] : 'no description'
      tag = Tag.all.find_by(title: 'calendar')
      images = []

      if resource[:image_urls]
        resource[:image_urls].each do |url|
          images.push(Image.find_or_create_by(url: url))
        end
      end

      new_resource = Resource.new(
        title: title,
        url: url,
        images: images,
        media_type: media_type,
        month_published: month_published,
        year_published: year_published,
        description: "a new resource in the calendar collection"
      )

      new_resource.tags.push(tag)

      if new_resource.save
        puts "new_resource: #{new_resource[:title]} saved."
      else
        puts "resource not saved: " + new_resource[:title]
      end
    end
  end
end
