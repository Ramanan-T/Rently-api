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
        
        @company = Company.new(params.require(:company).permit(:company_name,:company_contact,:company_address))
        
        
        if @company.save
        redirect_to company_admin_agent_path(:company_id =>@company.id)

        else
            flash.alert = "Company was not created"
            render 'new'
        end
    end


    #get companies/company_id/admin_agent/:id  
    def admin_agent 
        

    end 
end
