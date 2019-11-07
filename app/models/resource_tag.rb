class ResourceTag < ApplicationRecord
  belongs_to :tag, dependent: :destroy
  belongs_to :resource, dependent: :destroy
end
