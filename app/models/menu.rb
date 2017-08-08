class Menu < ApplicationRecord
  belongs_to :restautant, class_name: 'User', foreign_key: 'restaurant_id'

  scope :for_date, -> (date) { where(date: date).joins(:restautant).select('menus.id, meals, users.name as restaurant') }
end
