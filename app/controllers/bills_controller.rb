class BillsController < ApplicationController
  before_action :authenticate_user!
  def index
    @bills = current_user.bills.all
  end

  def new
    @bill = current_user.bills.build
  end
 
  def create
    @bill = current_user.bills.build(bills_params)
    if @bill.save
      flash[:success] = t('created_successfully')
      redirect_to bills_path(@bill)
    else
      render :new
    end
  end

  def edit
    @bill = Bill.find(params[:id])
  end

  def update
    @bill = Bill.find(params[:id])
    if @bill.update(bills_params)
      flash[:success] = t('updated_successfuly')
      redirect_to bills_path(@bill)
    else
      render :edit
    end
  end

  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy
  end

  private
    def bills_params
      params.require(:bill).permit(:item_id, :user_id, :item_price)
    end
end
