class Resource < ApplicationRecord
  has_many :tag_resources
  has_many :tags, through: :tag_resources
end
