class Smartlock < ApplicationRecord
    belongs_to:property,optional: true
    has_many:codes , dependent: :destroy
    belongs_to:company
    
    validates_uniqueness_of :serial_num

    

end
