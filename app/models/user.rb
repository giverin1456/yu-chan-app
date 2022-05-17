class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :outpatients
  has_many :somatics
  has_one_attached :image

  belongs_to_active_hash :prefecture
  belongs_to_active_hash :know
  belongs_to_active_hash :gender


  def self.search(search)
    if search != ""
      User.where('name LIKE(?)', "%#{search}%")
    else
      User.all
    end
  end
end
