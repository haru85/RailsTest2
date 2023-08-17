class Room < ApplicationRecord
    belongs_to :user
    validates :name, presence: true
    validates :detail, presence: true
    validates :fee, presence: true
    validates :address, presence: true
    has_many :reservations
end
