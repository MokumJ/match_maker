class PagesController < ApplicationController
  def home
		redirect_to pairs_path if current_user.profile.role == "admin"
  end
end
