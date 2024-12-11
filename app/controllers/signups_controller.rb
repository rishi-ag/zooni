class SignupsController < ApplicationController
  before_action :ensure_frame_response, only: %i[new]

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

    if @signup.save
      redirect_to root_path
    end
  end

  private

  def ensure_frame_response
    redirect_to root_path unless turbo_frame_request?
  end

  def signup_params
    params.require(:signup).permit(:name, :email)
  end
end
