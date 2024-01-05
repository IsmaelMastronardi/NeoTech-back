class CartIconsController < ApplicationController
  before_action :set_cart_icon, only: %i[ show update destroy ]

  # GET /cart_icons
  def index
    @cart_icons = CartIcon.all

    render json: @cart_icons
  end

  # GET /cart_icons/1
  def show
    render json: @cart_icon
  end

  # POST /cart_icons
  def create
    @cart_icon = CartIcon.new(cart_icon_params)

    if @cart_icon.save
      render json: @cart_icon, status: :created, location: @cart_icon
    else
      render json: @cart_icon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cart_icons/1
  def update
    if @cart_icon.update(cart_icon_params)
      render json: @cart_icon
    else
      render json: @cart_icon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cart_icons/1
  def destroy
    @cart_icon.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_icon
      @cart_icon = CartIcon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_icon_params
      params.require(:cart_icon).permit(:quantity, :cart_id, :item_id)
    end
end
