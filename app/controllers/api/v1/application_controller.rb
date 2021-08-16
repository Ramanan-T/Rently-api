
module Api
    module V1
    class ApplicationController < ActionController::API
      # equivalent of authenticate_user! on devise, but this one will check the oauth token
      before_action :doorkeeper_authorize!
        

      
      private
  
      # helper method to access the current user from the token
      def current_agent 
        @current_agent ||= Agent.find_by(id: doorkeeper_token[:resource_owner_id])
      end
    end

    #tried custom error message for 401 authorised 
    def doorkeeper_unauthorized_render_options(error: nil)
        @error_key = :unauthorized
        @error_message = 'The access token is not valid.'
        #check the last statement 
        {json: render_to_string('api/open/v1/errors/general.json.jbuilder')}
      end
    
      
end
  end