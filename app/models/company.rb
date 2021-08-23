class Company < ApplicationRecord
    has_many:agents
    has_many:properties

    validates:company_name,presence:true
end
