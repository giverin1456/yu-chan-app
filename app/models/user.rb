class User < ApplicationRecord
  has_many :outpatients
  has_many :somatics
  has_one_attached :image
end
