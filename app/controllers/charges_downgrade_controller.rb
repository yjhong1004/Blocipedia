class ChargesDowngradeController < ApplicationController
  before_action :authenticate_user!
  def downgrade_user
    wiki = Wiki.new
    wiki.downgrade
  end
end
