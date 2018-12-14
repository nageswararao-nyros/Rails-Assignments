class Author < ApplicationRecord
  validates :name, uniqueness: true
  has_many :articles
  belongs_to :nationality
  scope :nationality_id, ->{where(nationality_id:1)}
  scope :grade, ->{where(grade:"A")} 
end
