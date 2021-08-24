class Agent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :phone,
         :numericality => true,
         :length => { :minimum => 10, :maximum => 10 }

  validates_uniqueness_of :email , :message=>"Email ID already taken"
  after_create:send_subagent_email
  belongs_to :company ,optional:true
  has_many :properties, through: :company
  validates :role,:name , presence:true
 

    def self.authenticate(email, password)
      user = Agent.find_for_authentication(email: email)
      user&.valid_password?(password) ? user : nil
    end

        
    private 
    def send_subagent_email
      if self.role=="Non-admin"
        @agent = self 
        SendCodeMailer.with(agent:@agent).agent_credentials_email.deliver_now 
      end 
    end

end
