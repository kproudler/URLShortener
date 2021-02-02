class ShortenedUrl < ApplicationRecord

    validates :short_url, uniqueness: true
    validates :long_url, :short_url, :user_id, presence: true

    belongs_to :user,
        primary_key: :id,
        class_name: :User,
        foreign_key: :user_id
    
    

    def self.random_code
        loop do
            code = SecureRandom::urlsafe_base64(16)
            return code unless ShortenedUrl.exists?(short_url: code)
        end
    end

    def self.create_url(user, long_url)
        ShortenedUrl.create!(
            user_id: user.id,
            long_url: long_url,
            short_url: ShortenedUrl.random_code
        )
    end

    

end
