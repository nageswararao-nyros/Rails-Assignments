class Article < ApplicationRecord
	validates :title,:story, presence: { message: "Must be given please" }, length: { in:6..20 }
  validates :author_id, presence: true
  validates :title, uniqueness: true, length:{in:6..20}
  belongs_to :author, required: false
  after_create :article_publishing 
  after_update :article_update
  has_and_belongs_to_many :reviews

	private
	  def article_publishing
      puts "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD"
	    self.status = "success"
      self.save!
	   end 
	 def article_update
	   	puts "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD" 
  		self.status = "latestly updated"
	   end 
end
