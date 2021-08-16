class SendCodeMailer < ApplicationMailer
    def send_code_email
    
        @property = params[:property]
        mail(to: 'ramananaustin@gmail.com', subject: "You got a new code!")
    end

    def agent_credentials_email

        @agent = params[:agent]
        mail(to: @agent.email , subject: "You account Details")

    end 
end
