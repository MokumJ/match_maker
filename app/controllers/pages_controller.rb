class PagesController < ApplicationController
  def home
		unless current_user.profile == nil || current_user.profile.role == "student"
			redirect_to pairs_path
		end

  end
end
