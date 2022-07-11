class TodosController < ApplicationController
  
  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save then
      flash[:notice] = "Successfully created"
      redirect_to todo_path(@todo )
    else
      flash[:notice] = "Not created"
      render 'new'
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  private 
    def todo_params
      params.require(:todo).permit(:name,:description)
    end
    
end