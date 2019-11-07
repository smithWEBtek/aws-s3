class Tag < ApplicationRecord
  has_many :tag_resources
  has_many :resources, through: :tag_resources
end
