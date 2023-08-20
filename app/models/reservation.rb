class Reservation < ApplicationRecord
    validates :checkin, presence: true
    validates :checkout, presence: true
    validates :people, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}
    validate :date_check

    belongs_to :user
    belongs_to :room
    
    def date_check
        if not(self.checkin.blank? && self.checkout.blank?) && self.checkin < Date.today
            errors.add(:checkin, "は、明日以降の日付を指定して下さい")
        elsif not(self.checkin.blank? && self.checkout.blank?) && self.checkout <= self.checkin
            errors.add(:checkout, "は、チェックイン日の翌日以降の日付を指定して下さい")
        end
    end
end
