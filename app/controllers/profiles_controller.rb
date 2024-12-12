class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] # Ensure user is logged in for specific actions
  before_action :set_profile, only: [ :edit, :update]

  def index
    @profiles = Profile.all
  end

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params) # Correct method for a `has_one` association

    if @profile.save
      redirect_to profile_path(@profile), notice: 'Profile created successfully.'
    else
      render :new
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    # Ensure `@profile` is set by `set_profile`
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end

  # def destroy
  #   # Ensure `@profile` is set by `set_profile`
  #   @profile.destroy
  #   redirect_to profiles_path, notice: 'Profile deleted successfully.'
  # end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:name, :contact_no, :age, :gender)
  end
end
