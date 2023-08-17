class Room < ApplicationRecord    
    validates :name, presence: true
    validates :detail, presence: true
    validates :fee, presence: true
    validates :address, presence: true

    belongs_to :user
    has_many :reservations
end
