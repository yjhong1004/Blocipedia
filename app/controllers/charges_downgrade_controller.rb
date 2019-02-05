class ChargesDowngradeController < ApplicationController
def downgrade

  current_user.update_attribute(:role, 'standard')
  flash[:notice] = "#{current_user.email} have downgraded to the standard membership."
  redirect_to new_charge_path
end
end
