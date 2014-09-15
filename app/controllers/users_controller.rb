class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :find_skills, only: [:show, :destroy]
  before_action :find_roles, only: [:show, :create, :edit]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    find_roles
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def user_dev_activities
    @dev_activity = current_user.dev_activities
  end

  def user_search
    @q = User.search(params[:q])
    @users = @q.result.includes(:user)
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  # Creates the user - 
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  # Updates the user with the allowed parameters - redirects to profile when updated successfully
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render action: 'show', status: :updated, location: @user }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  # Currently not in use - will change this to redirect to mainpage when utilised
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Finds the user when an ID is provided
    def set_user
      @user = User.find(params[:id])
    end

    def find_skills
      @user = User.find(params[:id])
      @user_skill = UserSkill.where("user_id = @user.id")
    end

    def find_roles
      @user = User.find(params[:id])
      @role = Role.where("id = @user.role_id")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # Any new parameters need to be added here as well as in the user controller to have them store correctly
    def user_params
      params.require(:user).permit(:first_name, :surname, :email, :workgroup, :role_id, :job_grade, :location, :team, :admin, :line_manager)
    end
end
