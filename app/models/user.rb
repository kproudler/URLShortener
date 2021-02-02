class User < ApplicationRecord

    validates :email, presence: true, uniqueness: true

    has_many :submitted_urls,
        primary_key: :id,    
        class_name: :ShortenedUrl,
        foreign_key: :user_id
        

end
