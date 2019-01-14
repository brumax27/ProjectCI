class StudentsController < ApplicationController
  getter students = Students.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_students }
  end

  def index
    students = Students.all
    render "index.slang"
  end

  def show
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    students = Students.new students_params.validate!
    if students.save
      redirect_to action: :index, flash: {"success" => "Created students successfully."}
    else
      flash["danger"] = "Could not create Students!"
      render "new.slang"
    end
  end

  def update
    students.set_attributes students_params.validate!
    if students.save
      redirect_to action: :index, flash: {"success" => "Updated students successfully."}
    else
      flash["danger"] = "Could not update Students!"
      render "edit.slang"
    end
  end

  def destroy
    students.destroy
    redirect_to action: :index, flash: {"success" => "Deleted students successfully."}
  end

  private def students_params
    params.validation do
      required :name
      required :age
      required :grade
    end
  end

  private def set_students
    @students = Students.find! params[:id]
  end
end
