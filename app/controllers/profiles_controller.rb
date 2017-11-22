class ProfilesController < ApplicationController
	before_action :set_profile, only: [:edit, :update, :show]
	before_action :authenticate_user!


  def index
    @profiles = Profile.all.order(:role, :first_name)

  end


	def show
		@profile = Profile.find(params[:id])
	end

	def new
		 @profile = Profile.new
	end

	def create
			@profile = current_user.build_profile(profile_params)

		if @profile.save
			redirect_to edit_profile_path(@profile), notice: "Profile successfully created"
		else
			render :new
		end
	end


  def make_admin
    profile = Profile.find params[:id]
    profile.update( :role => "admin" )
    redirect_to profiles_url
  end

  def make_student
    profile = Profile.find params[:id]
    profile.update( :role => "student" )
    redirect_to profiles_url
  end
  
  def edit
  end


	def edit
	end

	def update
		if @profile.update(profile_params)
			redirect_to edit_profile_path(@profile), notice: "Profile successfully updated"
		else
			render :edit
		end
	end

	private
		def set_profile
			@profile = current_user.profile
		end

		def profile_params
			params.require(:profile).permit(:first_name, :last_name, :role)
		end
end
