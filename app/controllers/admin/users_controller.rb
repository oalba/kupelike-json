module Admin
  class UsersController < ApplicationController
    # before_filter :authenticate_user!
    # devise :database_authenticatable, :registerable,
    #        :recoverable, :rememberable, :trackable, :validatable
    before_action :authenticate_user!
    load_and_authorize_resource
    # after_action :load_and_authorize_resource
    # load_and_authorize_resource

    def index
      @users = User.all

      respond_to do |format|
        format.html # index.html.erb
        format.xml { render xml: @users }
        format.json { render json: @users }
      end
    end

    def show
      @user = User.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml { render xml: @user }
        format.json { render json: @user }
      end
    end

    def new
      @user = User.new

      respond_to do |format|
        format.html # new.html.erb
        format.xml { render xml: @user }
        format.json { render json: @user }
      end
    end

    def create
      # @user = user.new(user_params)
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          format.html { redirect_to admin_users_path, success: 'User created successfully.' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new", error: "User could not be created." }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
      # render plain: params[:user].inspect
    end

    def edit
      # authorize! :edit, @user
      @user = User.find(params[:id])
    end

    # def update
    #   @user = User.find(params[:id])

    #   if @user.update(user_params)
    #     redirect_to admin_users_path
    #   else
    #     render 'edit'
    #   end
    # end

    def destroy
      @user = User.find(params[:id])

      respond_to do |format|
        if @user.destroy
          format.html { redirect_to admin_users_path, success: 'User deleted successfully.' }
          format.json { head :no_content }
        else
          format.html { redirect_to admin_users_path, error: "User could not be deleted." }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
      # index
    end

    def update
      @user = User.find(params[:id])
      if user_params[:password].blank?
        @user.update_without_password(user_params)
      else
        @user.update_attributes(user_params)
      end

      respond_to do |format|
        if @user.errors.blank?
          if current_user.role == "admin"
            format.html { redirect_to admin_users_path, success: 'User updated successfully.' }
          else
            format.html { redirect_to index_path, success: 'User updated successfully.' }
          end
          format.json { head :no_content }
        else
          format.html { render action: "edit", error: "User could not be updated." }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :surnames, :address, :phone, :role_id, :place_id)
    end
  end
end
