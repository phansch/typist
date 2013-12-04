class Practice < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson

  validates :user_id, :lesson_id, presence: true

end
