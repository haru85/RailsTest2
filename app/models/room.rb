class Room < ApplicationRecord    
    validates :name, presence: true
    validates :detail, presence: true
    validates :fee, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}
    validates :address, presence: true

    belongs_to :user
    has_many :reservations
end
