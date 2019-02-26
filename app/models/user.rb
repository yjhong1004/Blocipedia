class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :wikis
  has_many :collaborators
  has_many :wikis, through: :collaborators

  after_initialize :init

  def init
    #this sets the default role if it's nil
    self.role ||= 0.0
  end

  enum role: [:standard, :admin, :premium]
end
