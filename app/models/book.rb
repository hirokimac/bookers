class Book < ApplicationRecord
    
        validates :title, presence: true
        validates :body, presence: true
        validates :body, length: { maximum: 50 }

    belongs_to :user

end
