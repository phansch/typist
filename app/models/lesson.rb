class Lesson < ActiveRecord::Base
  has_many :practices
  has_many :users, through: :practices
end
