class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: %i[ show update destroy ]

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
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

  def fill_and_complete_order
    @user = User.find(params[:user_id])
    @order = @user.current_order || @user.create_order
  
    ActiveRecord::Base.transaction do
      params[:order].each do |item_name, item_details|
        item_id = item_details["item"]["id"]
        @order.items << Item.find(item_id)
        order_item = @order.order_items.last
        order_item.update(quantity: item_details["quantity"])
      end
  
      @order.calculate_total_price
      @order.complete_order
  
      if @order.save
        render json: [@order, @user.past_orders], status: :ok
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:user_id, :completed, :total_price, :items, :order_items)
    end
end
