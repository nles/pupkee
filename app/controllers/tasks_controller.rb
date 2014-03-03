class TasksController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :html

  # GET /tasks
  # GET /tasks.json
  def index
    @main_list = Task.where(:done => false).order("deadline ASC")
    @main_list_header = "Not done"
    @done_unbilled_tasks = Task.where(:done => true, :billed => 0).order("deadline ASC")
    @active_subnavi = "DEFAULT";
    index!
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
    @task_efforts = Effort.where(:task_id => @task.id)
    @spend_effort_url = new_effort_path(:format => :js, :task_id => @task.id, :user_id => current_user.id)
    show!
  end

  # GET /tasks/all
  # GET /tasks/all.json
  def all
    @main_list = Task.order("deadline ASC")
    @main_list_header = "All tasks"
    @done_unbilled_tasks = []
    @active_subnavi = "ALL";
    render :index
  end

  # GET /tasks/user
  # GET /tasks/user.json
  def user
    users_tasks = current_user.tasks
    @main_list = users_tasks.where(:done => false).order("deadline ASC")
    @main_list_header = "Not done"
    @done_unbilled_tasks = users_tasks.where(:done => true, :billed => 0).order("deadline ASC")
    @active_subnavi = "USER";
    render :index
  end
end
