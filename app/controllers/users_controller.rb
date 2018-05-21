class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @review = Review.new
    @reviews = @user.reviews
    @star = 0
    @reviews.each do |review|
      @star += review.star
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Nomasalo !"
      redirect_to users_path
    else
      flash.now[:notice] = "Failed"
      render :new
    end
  end

  # def create
  #     if env['omniauth.auth'].present?
  #          # Facebookログイン
  #          @user  = User.from_omniauth(env['omniauth.auth'])
  #          result = @user.save(context: :facebook_login)
  #          fb       = "Facebook"
  #      else
  #          # 通常サインアップ
  #          @user  = User.new(user_params)
  #          result = @user.save
  #          fb       = ""
  #      end
  #      if result
  #          sign_in @user
  #          flash[:success] = "#{fb}ログインしました。"
  #          redirect_to @user
  #      else
  #          if fb.present?
  #              redirect_to auth_failure_path
  #          else
  #              render 'new'
  #          end
  #      end
  #  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end


  private

    def user_params
      params.require(:user).permit(:name, :email,:sex,:image, :age, :country, :password, :password_confirmation)
    end
end
