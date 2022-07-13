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
  
  def edit
    @todo = Todo.find(params[:id])
  end
  
  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params) then
      flash[:notice] = "Successfully updated"
      redirect_to todo_path(@todo )
    else
      flash[:notice] = "Not updated"
      render 'edit'
    end
  end
  
  def index
    @todos = Todo.all
  end
  
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    flash[:notice] = "Successfully destroyed"
    redirect_to todos_path
  end
  
  private 
    def todo_params
      params.require(:todo).permit(:name,:description)
    end
    
end