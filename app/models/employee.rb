class Employee < User
  has_many :votes, foreign_key: 'employee_id'
end
