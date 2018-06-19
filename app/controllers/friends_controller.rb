class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  # GET /friends
  # GET /friends.json
  def index
    @friends = Friend.all
    @frienden = @friends.where(receiver_id: current_user)

    id = params[:friend]
    if id
      @got = @frienden.where(id: id)
      @got.update(status: 'accepted')
      #@notification = Notification.create(user_id: @got, receiver_id: @got.user_id, action: 'friend', info: 'accepted your friend Request', picture: nil)
      #@notification.save
    end

    @date = Date.today
    @recent_friend = @frienden.where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
  end

  # GET /friends/new
  def new
    @friend = Friend.new
  end

  # GET /friends/1/edit
  def edit
  end

  def create
    id = params[:user]
    @friend = Friend.create(user: current_user, receiver_id: id, action: 'send you a Friend Request', status: 'waiting' )
    if @friend.save
      set_notification_for_friendRQ
      redirect_to friends_path, notice: 'friend Request have been send'
    end
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    id = params[:friend]
    #@friend = Friend.find(params[:id])
    respond_to do |format|
        puts 'you are in'
      if @friend.update(status:'accepted').where(@friend == id)
        puts 'was updated successfuly'
        redirect_to friends_path
        format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend.destroy
    delete_friend_RQ
    respond_to do |format|
      format.html { redirect_to friends_url, notice: 'Friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end
end
