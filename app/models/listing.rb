require 'date'
class Listing < ApplicationRecord
    belongs_to :user
    validates :price, :avail_date_begin, :avail_date_end, :avail_period, :address,  presence: true
    validate :avail_date_begin_cannot_be_in_the_past, :avail_date_end_cannot_be_before_avail_date_begin, :avail_period_cannot_be_longer_than_avilable_time_period

    def avail_date_begin_cannot_be_in_the_past
        if avail_date_begin.present? && avail_date_begin < Date.today
          errors.add(:avail_date_begin, "can't be in the past")
        end
    end

    def avail_date_end_cannot_be_before_avail_date_begin
        if avail_date_begin > avail_date_end
            errors.add(:avail_date_end, "available end date cannot be before available begin date")
        end
    end
    
    def avail_period_cannot_be_longer_than_avilable_time_period
        if avail_period > Date.parse(avail_date_end.to_s)- Date.parse(avail_date_begin.to_s)
            errors.add(:avail_period, "available period cannot be longer than available time period")
        end
    end

end
