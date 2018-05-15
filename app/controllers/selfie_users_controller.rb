class SelfieUsersController < ApplicationController
  before_action :set_selfie_user, only: [:show, :edit, :update, :destroy]

  # GET /selfie_users
  # GET /selfie_users.json
  def index
    @selfie_users = SelfieUser.all
  end

  # GET /selfie_users/1
  # GET /selfie_users/1.json
  def show
  end

  # GET /selfie_users/new
  def new
    @selfie_user = SelfieUser.new
  end

  # GET /selfie_users/1/edit
  def edit
  end

  # POST /selfie_users
  # POST /selfie_users.json
  def create
    @selfie_user = SelfieUser.new(selfie_user_params)

    respond_to do |format|
      if @selfie_user.save
        format.html { redirect_to @selfie_user, notice: 'Selfie user was successfully created.' }
        format.json { render :show, status: :created, location: @selfie_user }
      else
        format.html { render :new }
        format.json { render json: @selfie_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selfie_users/1
  # PATCH/PUT /selfie_users/1.json
  def update
    respond_to do |format|
      if @selfie_user.update(selfie_user_params)
        format.html { redirect_to @selfie_user, notice: 'Selfie user was successfully updated.' }
        format.json { render :show, status: :ok, location: @selfie_user }
      else
        format.html { render :edit }
        format.json { render json: @selfie_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selfie_users/1
  # DELETE /selfie_users/1.json
  def destroy
    @selfie_user.destroy
    respond_to do |format|
      format.html { redirect_to selfie_users_url, notice: 'Selfie user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selfie_user
      @selfie_user = SelfieUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selfie_user_params
      params.require(:selfie_user).permit(:name, :email, :user_id)
    end
end
