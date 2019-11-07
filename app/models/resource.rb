class Resource < ApplicationRecord
  has_many :resource_tags
  has_many :tags, through: :resource_tags
  has_one_attached :featured_image
end
