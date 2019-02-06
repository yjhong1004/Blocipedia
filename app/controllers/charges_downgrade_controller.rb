class ChargesDowngradeController < ApplicationController
def downgrade
  flash[:alert] = "Your wikis will become public if you downgrade."
  current_user.wikis.each {|wiki| wiki.update_attribute(:private, false) }
  current_user.update_attribute(:role, 'standard')
  flash[:notice] = "#{current_user.email} have downgraded to the standard membership."
  redirect_to new_charge_path
end
end
