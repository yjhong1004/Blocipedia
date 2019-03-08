class Wiki < ApplicationRecord
  belongs_to :user
  after_initialize :init
  def init
    self.private = false if (self.has_attribute? :private) && self.private.nil?
  end

  has_many :collaborators
  has_many :users, through: :collaborators

end
