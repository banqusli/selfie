class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!
  before_action :control_users!, only: [:destroy, :update]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.all
    @pictures = @pictures.order(created_at: :desc)
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit
  end

  def upvote
    @picture = Picture.find(params[:id])
    @picture.upvote_by current_user
    redirect_back fallback_location: pictures_path
    if current_user == @picture.user
      return true
    else current_user.voted_up_on?(@picture)
      @notification = Notification.create(:user_id => current_user.id, :receiver_id => @picture.user_id, :action => 'like', :info => 'liked your Picture', picture: @picture)
      @notification.save
    end
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(picture_params)

    respond_to do |format|
      if @picture.save
        set_notifications_for_create
        format.html { redirect_to @picture, success: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new, status: :unprocessable_entity}
        format.json { render json: @picture.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_update_params)
        format.html { redirect_to @picture, success: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    delete_notifications
    if @picture.destroy
      respond_to do |format|
        format.html { redirect_to pictures_url, success: 'Picture was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
      @user = @picture.user.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:image, :title, :description, :user_id)
    end

    def picture_update_params
      params.require(:picture).permit(:image, :title, :description)
    end
end
