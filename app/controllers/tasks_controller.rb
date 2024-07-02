class TasksController < ApplicationController
  before_action :set_tasks, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
  end

  def add
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    @task.update(task_params)
    # N'a pas besoin d'une view
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    # n'a pas besoin de view
    redirect_to task_path, status: :see_other
  end

  private
  def task_params # strong params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_tasks
    @task = Task.find(params[:id])
  end
end
