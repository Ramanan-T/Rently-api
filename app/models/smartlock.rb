class Smartlock < ApplicationRecord
    belongs_to:property,optional: true
    has_many:codes , dependent: :destroy
    
    
    validates_uniqueness_of :serial_num

    # after_create:add_codes_to_smartlock

    private
    def add_codes_to_smartlock
        
    end

end
