class TasksController < ApplicationController
  helper_method :sort_column, :sort_direction

  def new
    @task = Task.new
  end

def show
	  @task = current_user.tasks.find params[:id] 
  end

  def index
    @tasks = current_user.tasks.order(sort_column + ' ' + sort_direction).where(complited: false) 
    @tasks_complited = current_user.tasks.order(sort_column + ' ' + sort_direction).where(complited: true) 
  end

  def create
    @task = Task.create(task_params)

    if  
      @task.save
      redirect_to tasks_path
    else
      render "new"
    end 
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    @tasks = Task.all

    respond_to do |format|
      format.html { redirect_to tasks_path }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

def edit
    @task = current_user.tasks.find params[:id]
  end

def update
	  @task = Task.find(params[:id])

    if @task.update_attributes(task_params)
      redirect_to @task
    else
      render 'edit'
    end
  end

  def complete
    @task = Task.find(params[:id])
    @task.update_attributes(complited: true) 
    redirect_to tasks_path
  end

  def active_again
    @task = Task.find(params[:id])
    @task.update_attributes(complited: false) 
    redirect_to tasks_path
  end

  def destroy_multiple 
    @tasks = current_user.tasks.where(id: params[:tasks]).destroy_all 
    redirect_to tasks_path
  end

  private

  def sort_column
    Task.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

  private

  def task_params
    params.require(:task).permit(:user_id, :title, :description, :priority, :complited, :due_date)
  end

end