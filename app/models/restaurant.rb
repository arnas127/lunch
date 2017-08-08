class Restaurant < User
  has_many :menus, foreign_key: 'restaurant_id'
end
