class PagesController < ApplicationController
  def home
		if current_user.profile == nil
      redirect_to new_profile_path
    elsif current_user.profile.role == "student" || current_user.profile.role == nil
			redirect_to root_path
    else current_user.profile.role == "admin"
      redirect_to pairs_path
		end
		@pairs_schedule = Pair.all
  end
end
