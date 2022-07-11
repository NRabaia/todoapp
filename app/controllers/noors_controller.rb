class NoorsController < ApplicationController
  
  def new
    @noor = Noor.new
  end

  def create
    @noor = Noor.new(prod_params)
    if @noor.save then
      flash[:notice] = "Todo successfully created" 
      redirect_to noor_path(@noor )
      "redirect_to @post"
    else
      flash[:notice] = "Todo Not created"
      render 'new'
    end
  end 
  
  def show
    @todo = Todo.find(params[:id])
  end
  
  private
    def prod_params
      params.require(:noor).permit(:name,:description)
    end
  
end