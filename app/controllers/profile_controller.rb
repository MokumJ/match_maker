class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update, :show]
  before_action :authenticate_user!

  def index
    @profiles = Profile.all.order(:role , :first_name)
    render json: @profiles

  end

  def show
    @profile = Profile.find(params[:id])
  end

  def change_status
    @profile = Profile.find(params[:id])

    if @profile.role == "student" 
      @profile.role = "admin"
      @profile.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: @profile }
      end
    else
      @profile.role = "student"
      @profile.save

      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: @profile }
      end
    end
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
