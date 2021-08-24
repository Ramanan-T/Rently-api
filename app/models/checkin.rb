class Checkin < ApplicationRecord
    belongs_to:renter 
    belongs_to:property
    validates :renter ,presence:true
    validates :property,presence:true
end
