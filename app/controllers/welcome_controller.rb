class WelcomeController < ApplicationController

    def index
        if agent_signed_in?
        redirect_to properties_path
        end 

        if renter_signed_in?
            redirect_to properties_path
        end 

    end 
end
