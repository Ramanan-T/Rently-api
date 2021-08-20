class PropertiesController < ApplicationController
    def new
        @property= Property.new
    end 

    def create
        
        @property = Property.new(params.require(:property).permit(:property_name,:property_desc,:property_price,:property_address,images:[]))
        @property.company_id= current_agent.company_id

        if @property.save 
            redirect_to properties_path
        else
            render 'new'
        end 
    end

    def show
        @property = Property.find(params[:id])

    end

    def index
        
        if agent_signed_in?
        @company = Company.find(current_agent.company_id)
        @company.update(:flag=>1)
        @property= Property.where(:company_id=>current_agent.company_id);
        else
            @property=Property.all
        end
    end 

    def destroy
        @property = Property.find(params[:id])
        if @property.destroy
        redirect_to properties_path
        end 
    end

    def add_smartlock
        @smartlock = Smartlock.find(params[:id])
        for i in 0..9 do
            newcode= rand(10 ** 6)
            
            Code.create!(:code=>newcode,:smartlock_id=>@smartlock.id)
        end
        if @smartlock.update(:property_id=>params[:property_id])
            redirect_to  properties_path
        else 
            render 'index'
        end 
    end
    def edit
        @property=Property.find(params[:id])
    end



    #updating 
    def update
        @property=Property.find(params[:id]) 
        if @property.update(params[:property].permit(:property_name,:property_desc,:property_price,:property_address,images:[]))
          redirect_to properties_path
        else
          render 'edit'
        end
    end


    #remove smartlock

    def remove_smartlock
        @smartlock = Smartlock.where(:property_id => params[:property_id]).first
        @codes = Code.where(:smartlock_id=>@smartlock.id)
        
        if @smartlock.update(:property_id=>nil)
            @codes.each do |code|
                code.destroy 
            end
            flash.notice="Smartlock was removed"
            redirect_to properties_path
        else
            flash.notice="Failed to remove smartlock"
            redirect_to properties_path 
        end

    end

   

end