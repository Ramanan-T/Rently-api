ef create
            
            property = Property.new(params.require(:property).permit(:property_name,:property_desc,:property_price,:property_address,:company_id,images:[]))
            # property.company_id= current_agent.company_id
            if property.save 
                render json:{status: 'SUCCESS',message:"Saved Property",data:property},status: :ok
            

            else
                render json: {errors:property.errors.full_messages}
            
            end 
        end
    

        # GET method 
        def show
            property = Property.find(params[:id])
            respond_with property 
    
        end
    

        #property index GET
        def index

            if agent_signed_in?
            @property= Property.where(:company_id=>current_agent.company_id);
            else
                @property=Property.all
            end
            # api json rendering 
           
        end 

 
        #destroy property DELETE
        def destroy
            property = Property.find(params[:id])
            if property.destroy
                render json: {errors:property.errors.full_messages}
            # redirect_to properties_path
            end 
        end
    

        #assigning smartlocks PATCH
        def add_smartlock
            smartlock = Smartlock.find(params[:id])
            for i in 0..9 do
                newcode= rand(10 ** 6)
                
                Code.create!(:code=>newcode,:smartlock_id=>@smartlock.id)
            end
            if @smartlock.update(:property_id=>params[:property_id])
                render json: {smartlock_details: smartlock ,code_details: Code.where(:smartlock_id)}
                
            else 
                flash.notice="Failed to add Smartlock"
                render 'index'
            end 
        end

       # edit property GET
        
    
    
    
        #updating property PATCH
        def update
            property=Property.find(params[:id]) 
            if property.update(params[:property].permit(:property_name,:property_desc,:property_price,:property_address))
                render json: {errors:property.errors.full_messages}
            else
              render 'edit'
            end
        end
    