class Outpatient < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :medical_category

  with_options presence: true do
    validates :price
    validates :start_time
    with_options numericality: { other_than: 1, message: 'を選択して下さい' } do
    validates :medical_category_id
    end
  end
end
