class TasksController < ApplicationController

	def new
		@task = Task.new
	end

	def show
	
	 @task = Task.find(params[:id])
     
    end


    def index

    	@tasks = current_user.tasks
    end

    def create
      @task = Task.new(task_params)
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
	end

	def edit
	  @task = Task.find(params[:id])
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
    redirect_to @task
     
  end

  def active_again

    @task = Task.find(params[:id])
    @task.update_attributes(complited: false) 
    redirect_to @task
     
  end



   private
      def task_params
        params.require(:task).permit(:user_id, :title, :description, :priority, :complited, :due_date)
	  end


end