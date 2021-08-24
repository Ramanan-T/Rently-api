class Company < ApplicationRecord
    has_many:agents
    has_many:properties

    validates:company_name,presence:true
    validates :company_contact,
         :numericality => true,
         :length => { :minimum => 10, :maximum => 12 }

    #active admin customisation
    def to_s
        self.company_name + "-" + (self.id).to_s
    end
end
