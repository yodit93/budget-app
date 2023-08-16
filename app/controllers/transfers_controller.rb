class TransfersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @category = Category.find(params[:category_id])
    @transfers = @category.transfers.where(author_id: current_user.id).order(created_at: :desc)
  end

  def new
    @categories = current_user.categories.all
    @transfer = Transfer.new
  end

  def create
    category = Category.find(params[:transfer][:category_id])
    transfer = current_user.transfers.new(transfer_params)
    CategoryTransfer.create(category:, transfer:)
    if transfer.save
      flash[:notice] = 'Transfer was successfully created.'
      redirect_to category_transfers_path(category)
    else
      render 'new'
    end
  end

  private

  def transfer_params
    params.require(:transfer).permit(:name, :amount, :author_id)
  end
end
