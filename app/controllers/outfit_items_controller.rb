class OutfitItemsController < ApplicationController
  before_action :set_outfit_item, only: %i[ show edit update destroy ]

  def index
    @outfit_items = OutfitItem.all
  end

  def show
  end

  def new
    @outfit_item = OutfitItem.new
  end

  def edit
  end

  def create
    @outfit_item = OutfitItem.new(outfit_item_params)

    respond_to do |format|
      if @outfit_item.save
        format.html { redirect_to outfit_item_url(@outfit_item), notice: "Outfit item was successfully created." }
        format.json { render :show, status: :created, location: @outfit_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @outfit_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @outfit_item.update(outfit_item_params)
        format.html { redirect_to outfit_item_url(@outfit_item), notice: "Outfit item was successfully updated." }
        format.json { render :show, status: :ok, location: @outfit_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @outfit_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @outfit_item.destroy

    respond_to do |format|
      format.html { redirect_to outfit_items_url, notice: "Outfit item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_outfit_item
      @outfit_item = OutfitItem.find(params[:id])
    end

    def outfit_item_params
      params.require(:outfit_item).permit(:outfit_id, :item_id)
    end
end
