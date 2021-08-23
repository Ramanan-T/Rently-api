module Api 
    module V1
    class SmartlockController < ApplicationController
        respond_to :json
        # skip_before_action :verify_authenticity_token ,:only => [:create,:destroy]
        before_action :doorkeeper_authorize!

        def create
        @smartlock= Smartlock.new(params.permit(:serial_num,:property_id,:company_id))
        @smartlock.property_id = nil
        @smartlock.company_id= current_agent.company_id
        
        if @smartlock.save
            render json:{status: 'SUCCESS',message:"Saved Smartlock",data:@smartlock},status: :ok
            
        else
            render json: {errors:@smartlock.errors.full_messages}
        end
    end 
    

    def show
        if smartlock= Smartlock.find(params[:id])
        render json:{status: 'SUCCESS' ,message:"Loaded Smartlock Index ",data: smartlock},status: :ok
        else
            render json: {errors:smartlock.errors.full_messages}
        end
    end
    def index
        smartlock= Smartlock.where(:property_id=>nil)

        if smartlock==nil
            render json:{status:'SUCCESS', message:"No smartlocks were found"},status: :ok

        else
        render json:{status: 'SUCCESS' ,message:"Loaded Smartlock Index ",data: smartlock},status: :ok
        end 
    end
    


    def update
        @post = Smartlock.where(:property_id=>nil).first
        if @post.update(:property_id  => params[:property_id])

        render json:{status: 'SUCCESS' ,message:"Updated the smartlock ",data: @post},status: :ok

        else
            render json:{status: 'Failure' ,message:"Smartlock not updated"},status: :ok
        end
    end 

    def destroy
        @smartlock = Smartlock.find(params[:id])

        if @smartlock.destroy
            flash.alert = "Smartlock Removed"
            render json:{status: 'SUCCESS',message:"Smartlock was deleted",data:@smartlock},status: :ok
        else
            render json: {errors:@smartlock.errors.full_messages}
        end 

    end

    def display
        @smartlocks = Smartlock.where(:company_id => current_agent.company_id)
        @company = Company.find(current_agent.company_id)

        render json:{status: 'SUCCESS',message:"Smartlock under the Company",data:@smartlocks},status: :ok


    end


    
   

       
       
    

end #end of properties controller class 

end  #end of module V1

end #end of module #Api
