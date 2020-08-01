class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]
  def index
    @items = current_user.items.all
  end

  def new
    @item = current_user.items.build
  end
 
  def create
    @item = current_user.items.build(items_params)
    if @item.save
      flash[:success] = t('created_successfully')
      redirect_to items_path(@item)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      flash[:success] = t('updated_successfuly')
      redirect_to items_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end

  private
    def items_params
      params.require(:item).permit(:item_name, :item_price, :user_id)
    end
end
