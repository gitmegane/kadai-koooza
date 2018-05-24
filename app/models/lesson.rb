class Lesson < ApplicationRecord
  belongs_to :course
  
  validates :major_no, presence: true
  validates :content, presence: true, length: { maximum: 1000 }
  #validates :order, presence: true
  validates :course_id, presence: true


end
