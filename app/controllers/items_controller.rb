class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]
  # before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @items = current_user.items
    # @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
    authorize @item
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = current_user.items.new(item_params)
    authorize @item

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_item
      @item = current_user.items.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:photo_url, :color_hex, :details)
    end
    
    def user_not_authorized
      flash[:alert] = "Uh oh! You are not authorized to do this."
      redirect_to(request.referer || root_path)
    end
end
