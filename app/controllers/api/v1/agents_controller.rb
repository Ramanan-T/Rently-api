module Api 
    module V1
        class AgentsController < ApplicationController
             
             respond_to :json
            def new
                @agent =Agent.new
            end 
            def create
                @agent= Agent.new(params.require(:agent).permit(:name,:email,:phone,:company_id,:role))
                
                if @agent.role=="Non-admin"
                    @agent.password= @agent.email.split('@',2)[0]
                    @agent.password_confirmation=@agent.password
                end 
        
               
                if @agent.save
                    redirect_to properties_path
                else
                    flash.alert ="Sub agent was not created"
                    redirect_to companies_path
                end 
        
        
            end
        
            def addagents
                @agent=Agent.new()
                render json:{status: 'SUCCESS',message:"Sub agent addition",data:@agent},status: :ok
              end
        
              def destroy 
                @agent = Agent.find(params[:id])
        
                if @agent.destroy
                    redirect_to companies_path
                    flash.alert =" Sub Agent has been deleted"
                end
            end 
        
            def delete_image_attachment
                @image = ActiveStorage::Attachment.find(params[:id])
                @image.purge
        
                redirect_to properties_path
            end
        
            
        
        
        
        
        
       
       
    

end #end of properties controller class 

end  #end of module V1

end #end of module #Api
