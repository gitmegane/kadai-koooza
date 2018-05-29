class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :courses
  
  has_many :usercourses
  has_many :attends, through: :usercourses, source: :course

    #受講、受講解除
  def attendcourse(other_course)
    #unless self == other_user
    self.usercourses.find_or_create_by(course_id: other_course.id)
  end

  def unattendcourse(other_course)
    attendcourse = self.usercourses.find_by(course_id: other_course.id)
    attendcourse.destroy if attendcourse
  end
  
  def attends?(other_course)
    self.attends.include?(other_course)
  end
  
end