class Users::TeacherAssistantsController < ApplicationController
	layout "standard"

  def index
    @teacher_assistants = TeacherAssistant.search(params[:search], params[:page])
    @types = User.find_user_types(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.js { render :partial => "users/user_list", :locals => { :users => @teacher_assistants } }
    end
  end


  def show
  #  @teacher_assistant = TeacherAssistant.find(params[:id])
    respond_to do |format|
      format.html	{ redirect_to :action => :index }
    end
  end

  # GET /teacher_assistants/new
  # GET /teacher_assistants/new.xml
  def new
    @teacher_assistant = TeacherAssistant.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @teacher_assistant }
    end
  end

  # GET /teacher_assistants/1/edit
  def edit
    @teacher_assistant = TeacherAssistant.find(params[:id])
  end

  # POST /teacher_assistants
  # POST /teacher_assistants.xml
  def create
    @teacher_assistant = TeacherAssistant.new(params[:teacher_assistant])

    respond_to do |format|
      if @teacher_assistant.save
        flash[:notice] = "Teacher Assistant '#{@teacher_assistant.full_name}' was successfully created."
        format.html { redirect_to(@teacher_assistant) }
        format.xml  { render :xml => @teacher_assistant, :status => :created, :location => @teacher_assistant }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @teacher_assistant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /teacher_assistants/1
  # PUT /teacher_assistants/1.xml
  def update
    @teacher_assistant = TeacherAssistant.find(params[:id])

    respond_to do |format|
      if @teacher_assistant.update_attributes(params[:teacher_assistant])
        flash[:notice] = 'TeacherAssistant was successfully updated.'
        format.html { redirect_to(@teacher_assistant) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @teacher_assistant.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teacher_assistants/1
  # DELETE /teacher_assistants/1.xml
  def destroy
    @teacher_assistant = TeacherAssistant.find(params[:id])
    @teacher_assistant.destroy

    respond_to do |format|
      format.html { redirect_to(teacher_assistants_url) }
      format.xml  { head :ok }
    end
  end
end