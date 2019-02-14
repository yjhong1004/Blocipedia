class ChargesDowngradeController < ApplicationController
  def downgrade_user
    wiki = Wiki.new
    wiki.downgrade
  end
end
