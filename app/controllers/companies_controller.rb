class CompaniesController < ApplicationController

    def index
        if current_agent.role=="Admin"
        @companies=Company.first
        @agents = Agent.where(:role=>"Non-admin")
        else
            @companies=Company.first
        end 
    end
    def new 
        @company= Company.new()
        if Company.exists?
            flash.alert="A company is already present, contact your admin"
            redirect_to login_index_path
        end
    end 
    def create 
        
        @company = Company.new(params.require(:company).permit(:company_name,:company_contact,:company_address))
        
        
        if @company.save
        redirect_to new_agent_registration_path()

        else
            render 'new'
        end
    end
end
