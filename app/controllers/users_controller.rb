class UsersController < ApplicationController
    before_action :logged_in_user, only:[:edit, :update, :destroy]
    before_action :correct_user, only:[:edit, :update, :destroy]
    
    
    def show
      @user = User.find(params[:id])
    #   @posts = @user.posts.page(params[:page]).per(9)
    #   @star = Rate.where(rated_user_id:params[:id])
    #   if @star.present?
    #     stars = []
    #     @star.each do |star|
    #       stars << star.star
    #     end
    #     @star_average = stars.inject(:+)/stars.length
    #   else
    #     @star_average = 0
    #   end
    # end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        log_in @user
        flash[:success] = "新規登録が完了しました。"
        redirect_to @user
      else
        render 'new'
      end
    end
  
    def edit
      @user = User.find(params[:id])
    end
  
    def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] = "プロフィールが更新されました"
        redirect_to @user
      else
        render 'edit'
      end
    end
  
    def destroy
      User.find(params[:id]).destroy
      flash[:success] = "退会しました"
      redirect_to root_url
    end
  
    # def following
    #   @user  = User.find(params[:id])
    #   @users = @user.following
    #   render 'show_follow'
    # end
  
    # def followers
    #   @user  = User.find(params[:id])
    #   @users = @user.followers
    #   render 'show_follower'
    # end
    
  
    # beforeアクション
    #正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to (root_url) unless current_user?(@user)
    end
  
  
    private
     
    def user_params
        params.require(:user).permit(:name, :email, :password,
                        :password_confirmation, :image, :name_title,
                        :profile, :gender, :residence, :age)
    end
  end
  