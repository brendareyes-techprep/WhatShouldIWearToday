class OutfitsController < ApplicationController
  before_action :set_outfit, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :landing
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @outfits = current_user.outfits
  end

  def show
    @outfit = Outfit.includes(:items).find(params[:id])
    @items = @outfit.items
    Rails.logger.debug "Items: #{@items.inspect}"
  end

  def new
    @outfit = Outfit.new
  end

  def edit
  end

  def create
    # Remove outfit_items_attributes from outfit_params
    @outfit = current_user.outfits.new(outfit_params.except(:outfit_items_attributes))
    
    items_params = params[:outfit][:outfit_items_attributes].map { |item| item[:item_id] }
  
    Rails.logger.debug "items_params: #{items_params}"
    
    items_params.each do |item_id|
      next unless current_user.items.find_by(id: item_id)
  
      @outfit.outfit_items.build(item_id: item_id)
    end
  
    respond_to do |format|
      if @outfit.save
        format.html { redirect_to outfit_url(@outfit), notice: "Outfit was successfully created." }
        format.json { render :show, status: :created, location: @outfit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @outfit.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @outfit.update(outfit_params)
        format.html { redirect_to outfit_url(@outfit), notice: "Outfit was successfully updated." }
        format.json { render :show, status: :ok, location: @outfit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @outfit.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @outfit.destroy

    respond_to do |format|
      format.html { redirect_to outfits_url, notice: "Outfit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def landing
  end
  
  private
  def set_outfit
    @outfit = current_user.outfits.find(params[:id])
  end

  def outfit_params
    params.require(:outfit).permit(:image, :vibe, :name)
    # params.require(:outfit).permit(:image, :vibe, :name, outfit_items_attributes: [:item_id])
  end

  def user_not_authorized
    flash[:alert] = "Uh oh! You are not authorized to do this."
    redirect_to(request.referer || root_path)
  end
end
