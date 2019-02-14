class Wiki < ApplicationRecord
  belongs_to :user
  after_initialize :init
  def init
    self.private = false if (self.has_attribute? :private) && self.private.nil?
  end

  def downgrade

    current_user.wikis.update_all(:private, false)
    current_user.update_attribute(:role, 'standard')
    flash[:notice] = "#{current_user.email} have downgraded to the standard membership."
    redirect_to new_charge_path
  end
end
