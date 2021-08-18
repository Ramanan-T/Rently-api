class CompaniesController < ApplicationController

    def index
        if current_agent.role=="Admin"
        @companies=Company.find(current_agent.company_id)
        @agents = Agent.where(:role=>"Non-admin").where(:company_id=>current_agent.company_id)
        else
            @companies=Company.find(current_agent.company_id)
        end 
    end
    def new 
        @company= Company.new()
        
    end 
    def create 
        
        @company = Company.new(params.require(:company).permit(:company_name,:company_contact,:company_address,:flag))
        
        @company.flag=0;
        if @company.save
        redirect_to new_agent_registration_path()

        else
            render 'new'
        end
    end
end
