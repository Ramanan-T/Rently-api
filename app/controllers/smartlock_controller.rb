class SmartlockController < ApplicationController
    def new 
        @smartlock= Smartlock.new
    end 

    def create
        @smartlock= Smartlock.new(params.require(:smartlock).permit(:serial_num,:property_id))
        @smartlock.property_id = nil
        @smartlock.company_id= current_agent.company_id
        if @smartlock.save
            redirect_to properties_path
        else
            render 'new'
        end
    end 
    
    def index
        @smartlock= Smartlock.where(:property_id=>nil)
        
    end

    def edit 
       
        

    end

    def update
        @post = Smartlock.where(:property_id=>nil).first
        @post.update(property_id :property_id)


        
        redirect_to smartlocks_path
        
    end 

    def destroy
        @smartlock = Smartlock.find(params[:id])

        if @smartlock.destroy
            flash.alert = "Smartlock Removed"
            redirect_to properties_path
        end 

    end


    #displays all the smartlocks owned by the company
    def display
        @smartlocks = Smartlock.where(:company_id => current_agent.company_id)
        @company = Company.find(current_agent.company_id)


    end

    
end
