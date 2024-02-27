class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: %i[update destroy]
  before_action :set_user, only: %i[show]

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end

  # GET /orders/1
  def show
    @order = @user.current_order
    render json: @order
  end

  # GET /orders/1/show_current_order

  def show_current_order
    @user = User.find(params[:user_id])
    @order = @user.current_order || @user.create_order
    @order.save
    render json: @order, include: { order_items: { include: :item } }
  end

  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy!
  end

  # POST /orders/add_item

  def add_item
    @user = User.find(params[:user_id])

    ActiveRecord::Base.transaction do
      @order = @user.current_order || @user.create_order
      @item = Item.find(order_item_params[:item_id])
      @order_item = @order.order_items.find_by(item_id: @item.id)

      if @order_item.nil?
        @order_item = @order.order_items.new(item: @item, quantity: 1)
      else
        @order_item.update(quantity: @order_item.quantity + 1)
      end
      @order.save
      @order.calculate_total_price
      @order.save


      if @order_item.save
        render json: @order_item, status: :created
      else
        render json: @order_item.errors, status: :unprocessable_entity
        raise ActiveRecord::Rollback
      end
    end
  end

  # POST /orders/remove_one_item

  def remove_one_item
    @user = User.find(params[:user_id])
    @order = @user.current_order
    ActiveRecord::Base.transaction do
      if @order.nil?
        render json: { error: 'No active order found' }, status: :unprocessable_entity
        return
      end

      @order_item = @order.order_items.find_by(item_id: order_item_params[:item_id])
      if @order_item.nil?
        render json: { error: 'Item not found in the order' }, status: :unprocessable_entity
        return
      end

      if @order_item.quantity > 1
        @order_item.update(quantity: @order_item.quantity - 1)
      else
        @order_item.destroy
      end

      @order.calculate_total_price
      @order.save

      if @order_item.destroyed?
        render json: { message: 'Item removed successfully' }, status: :ok
      elsif @order_item.save
        render json: @order_item, status: :ok
      else
        render json: @order_item.errors, status: :unprocessable_entity
        raise ActiveRecord::Rollback
      end
    end
  end

  # POST /orders/remove_item

  def remove_item
    @user = User.find(params[:user_id])
    @order = @user.current_order

    ActiveRecord::Base.transaction do
      if @order.nil?
        render json: { error: 'No active order found' }, status: :unprocessable_entity
        return
      end

      @order_item = @order.order_items.find_by(item_id: order_item_params[:item_id])

      if @order_item.nil?
        render json: { error: 'Item not found in the order' }, status: :unprocessable_entity
        return
      end

      unless @order_item.destroy
        render json: { error: 'Failed to remove item from the order' }, status: :unprocessable_entity
        raise ActiveRecord::Rollback
      end

      @order.calculate_total_price

      unless @order.save
        render json: { error: 'Failed to update order' }, status: :unprocessable_entity
        raise ActiveRecord::Rollback
      end

      render json: { message: 'Item removed successfully' }, status: :ok
    end
  end

  # POST /orders/complete_order

  def complete_order
    @user = User.find(params[:user_id])
    @order = @user.current_order || @user.create_order
    @order.calculate_total_price
    @order.complete_order
    if @order.save
      render json: @order, status: :ok
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  def set_user
    @order = Order.find(params[:user_id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:user_id, :completed, :total_price, :items, :order_items)
  end

  def order_item_params
    params.require(:order_item).permit(:item_id, :amount)
  end
end
