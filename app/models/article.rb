class Article < ApplicationRecord
  # Model Validations Start
	validates :title,:story, presence: { message: "Must be given please" }, length: { in:6..20 }
  validates :author_id, presence: true
  validates :poster, attachment_presence: true
  validates :title,  length:{in:6..20}

  has_attached_file :poster, styles: {
        thumb: '10x10>',
        square: '200x200#',
        medium: '50x50>',
        pdf_preview: '600x600>'}, processors: [:thumbnail]
  validates_attachment :poster, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)},
  attachment_size: { less_than: 5.megabytes }
  has_attached_file :poster
  
  # Associations Start
  belongs_to :author
  has_and_belongs_to_many :reviews
  has_many :comments

  # Callbacks Start
  after_create :article_publishing 
  after_update :article_update
  
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
