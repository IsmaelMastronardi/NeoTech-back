class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy show_past_orders]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  def show_past_orders
    past_orders = @user.past_orders.includes(order_items: :item)
    render json: past_orders.to_json(include: { order_items: { include: :item } })
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: [@user, @user.current_order, @user.current_order.items], status: :created,
             location: api_v1_user_url(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # POST /users/create_temporary_user

  def create_temporary_user
    @user = User.create(name: 'Guest')
    if @user.save
      render json: @user, status: :created, location: api_v1_user_url(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name)
  end
end
