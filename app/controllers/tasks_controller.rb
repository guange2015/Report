class TasksController < ApplicationController
  include AuthenticatedSystem
  include TasksListSystem
  # Protect these actions behind an admin login
  before_filter :login_required, :except => :tasks_list

  # GET /tasks
  # GET /tasks.xml
  def index
    @tasks = current_user.tasks.order("created_at DESC")
    @finished = !(@tasks.where(:created_at => Time.zone.today..(Time.zone.today+1.day)).empty?)
    unless @finished
      @task = current_user.tasks.build
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = current_user.tasks.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @task = current_user.tasks.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = current_user.tasks.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.xml
  def create
    @task = current_user.tasks.build(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to(:action => :index, :notice => '日报提交成功.') }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    @task = current_user.tasks.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to(tasks_path, :notice => '日报修改成功.') }
        format.xml  { head :ok }
        format.js   {render :template =>'create.js.erb'}
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { head :ok }
    end
  end

  def tasks_list
    get_tasks_list
    render :template => 'user_mailer/tasks_list'
  end
end
