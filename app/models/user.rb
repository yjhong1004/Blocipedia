class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :wikis
  after_initialize :init

  def init
    #this sets the default role if it's nil
    self.role ||= 0.0
  end

  def downgrade

    self.wikis.update_all(private: false )
    self.update_attribute(:role, 'standard')

    
  end

  enum role: [:standard, :admin, :premium]
end
