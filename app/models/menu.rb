class Menu < ApplicationRecord
  belongs_to :restautant, class_name: 'User', foreign_key: 'restaurant_id'
  has_many :votes

  validates :date, presence: true, uniqueness: { scope: :restaurant_id }
  validates :meals, presence: true

  scope :for_date, -> (date) { where(date: date).joins(:restautant).select('menus.id, meals, users.name as restaurant') }
end
