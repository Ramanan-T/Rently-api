class CheckinController < ApplicationController
    def new
        @checkin = Checkin.new
    end 


    def create
        @checkin = Checkin.new(params.require(:checkin).permit(:serial_code,:property_id,:renter_id))
        @checkin.property_id = params[:property_id]
        @checkin.renter_id = current_renter.id
        
        @property= Property.find(params[:property_id])
        var=@property.smartlock.serial_num - @checkin.serial_code
        
            
        if var==0
            @checkin.save
                
            SendCodeMailer.with(property: @property).send_code_email.deliver_now 
        
            flash.now[:notice] = "Code has been sent to you email"
            @property.smartlock.codes.first.destroy
            render 'new'
            
            
        else
            flash.now[:notice] = "Wrong Smartlock Serial number"
            render 'new'
        end 
    end 

    def show
       
    end

    def index
        if agent_signed_in?
            @checkin = Checkin.where(:property_id => params[:property_id]).includes(:property,:renter)
        else
            redirect_to properties_path
        end 
    end
end
