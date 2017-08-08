class Vote < ApplicationRecord
  belongs_to :menu
  belongs_to :employee, class_name: 'User', foreign_key: 'employee_id'

  validates :menu_id, uniqueness: { scope: :employee_id }

  def self.group_for_date(date)
    votes =
      self.joins(menu: :restautant)
          .where('menus.date = ?', date)
          .select('count(votes.menu_id) as count, meals, users.name as restaurant')
          .group(:menu_id)

    result = {}

    votes.each do |row|
      result[row[:restaurant]] =
        {
          count: row[:count],
          meals: row[:meals]
        }
    end

    result
  end
end
