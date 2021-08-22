class Code < ApplicationRecord
    belongs_to:smartlock
    validates :code ,presence:true
end
