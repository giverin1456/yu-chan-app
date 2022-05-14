class User < ApplicationRecord
  has_many :outpatients
  has_one_attached :image
end
