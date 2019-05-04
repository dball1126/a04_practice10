class Link < ApplicationRecord
    validates :title, presence: true
    validates :url, presence: true

    belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

    has_many :comments

end