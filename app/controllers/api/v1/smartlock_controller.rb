module Api 
    module V1
    class SmartlockController < ApplicationController
        respond_to :json
        skip_before_action :verify_authenticity_token ,:only => [:create,:destroy]
        before_action :authenticate_agent!
        def create
        @smartlock= Smartlock.new(params.require(:smartlock).permit(:serial_num,:property_id))
        @smartlock.property_id = nil
        
        if @smartlock.save
            render json:{status: 'SUCCESS',message:"Saved Smartlock",data:@smartlock},status: :ok
            
        else
            render json: {errors:@smartlock.errors.full_messages}
        end
    end 
    

    def show
        smartlock= Smartlock.find(params[:id])
        respond_with smartlock
    
    end
    def index
        smartlock= Smartlock.where(:property_id=>nil)
        render json:{status: 'SUCCESS' ,message:"Loaded Smartlock Index ",data: smartlock},status: :ok
        
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
            render json:{status: 'SUCCESS',message:"Smartlock was deleted",data:@smartlock},status: :ok
        else
            render json: {errors:@smartlock.errors.full_messages}
        end 

    end

        

       
       
    

end #end of properties controller class 

end  #end of module V1

end #end of module #Api
