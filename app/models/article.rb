class Article < ApplicationRecord

	validates :title,:story, presence: { message: "Must be given please" },
                   length: { in:6..20 }
    validates :author_id, presence: true

    validates :title, uniqueness: true, length:{in:6..20}

   belongs_to :author, required: false

   
end
