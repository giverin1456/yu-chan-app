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

  with_options presence: true do
    validates :name
    validates :birthday
    validates :image
    with_options format: { with: /\A([ァ-ン]|ー)+\z/} do
      validates :kana
    end
    with_options numericality: { other_than: 1, message: 'を選択して下さい' } do
      validates :gender_id
      validates :know_id
      validates :prefecture_id
     end
     validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }, length: { is: 8 }
     validates :phone_number, format: { with: /\A\d{10,11}\z/ }, length: { maximum: 11 }
     validates :city
     validates :street
     validates :email
  end
end
