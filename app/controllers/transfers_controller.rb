class TransfersController < ApplicationController
    def index
        @category = Category.find(params[:category_id])
        @transfers = @category.transfers.all.order("created_at DESC")
    end
    def new
        @categories = Category.all
        @transfer = Transfer.new
    end
    def create
        @category = Category.find(params[:category_id])
        @transfer = Transfer.new(transfer_params)
        if @transfer.save
            flash[:notice] = "Transfer was successfully created."
            redirect_to category_transfers_path(@category)
        else
            render 'new'
        end
    end
    private
    def transfer_params
        params.require(:transfer).permit(:name, :amount, :author_id)
    end
end
