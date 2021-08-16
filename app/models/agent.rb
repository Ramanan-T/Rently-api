class Agent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         after_create:send_subagent_email
before_save :check_company_id 
belongs_to :company ,optional:true
has_many :properties, through: :company
 
         
        private 
        def send_subagent_email
          if self.role=="Non-admin"
            @agent = self 
            SendCodeMailer.with(agent:@agent).agent_credentials_email.deliver_now 
          end 
        end

        # modify code after adding flag variable to company table
          def check_company_id
            if self.company_id.blank?
                self.company_id = Company.first.id
                self.role="Admin"
            end 
          end
end
