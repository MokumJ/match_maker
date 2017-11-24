class PagesController < ApplicationController
  def home
		if current_user.profile.role == "admin"
			redirect_to pairs_path
		elsif current_user.profile == nil
			redirect_to new_profile_path
		else
			@pairs_schedule = Pair.all
		end
  end
end
