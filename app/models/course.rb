class Course < ApplicationRecord
  belongs_to :user


  validates :name, presence: true, length: { maximum: 30 }
  validates :major_no, presence: true
  validates :content, length: { maximum: 255 }
  validates :user_id, presence: true
  
  has_many :lessons
  
  has_many :usercourses
  has_many :attenders, through: :usercourses, source: :user
  
end