class Wiki < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD
  after_initialize :init
  def init
    self.private = false if (self.has_attribute? :private) && self.private.nil?
  end

=======
  has_many :collaborators
  has_many :users, through: :collaborators
>>>>>>> wiki-collaborators

end
