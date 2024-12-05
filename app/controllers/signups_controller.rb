class SignupsController < ApplicationController

  def index
    @signups = Signup.all
  end

  def show
    @signup = Signup.find(params[:id])
  end

  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(signup_params)
    @signup.save
    redirect_to signup_path
  end

  private

  def signup_params
    params.require(:signup).permit(:name, :email)
  end
end
