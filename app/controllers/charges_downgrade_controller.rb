class ChargesDowngradeController < ApplicationController
  
  def downgrade_user

    current_user.downgrade
    flash[:notice] = "#{current_user.email} have downgraded to the standard membership."
    redirect_to new_charge_path
  end
end
