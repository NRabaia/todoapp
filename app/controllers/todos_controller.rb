class TodosController < ApplicationController
  
  before_action :set_todo, only: [:edit,:show,:update,:destroy]
  
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
  end
  
  def edit
  end
  
  def update
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
    @todo.destroy
    flash[:notice] = "Successfully destroyed"
    redirect_to todos_path
  end
  
  private 
  
    def set_todo
      @todo = Todo.find(params[:id])
    end
  
    def todo_params
      params.require(:todo).permit(:name,:description)
    end
    
    
end