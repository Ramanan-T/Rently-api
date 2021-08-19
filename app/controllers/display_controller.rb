class DisplayController < ApplicationController

    def index
        @smartlocks = Smartlock.where(:company_id=>current_agent.company_id)
        
    end 
end
