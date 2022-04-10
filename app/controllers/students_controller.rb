
# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy]
  # skip_before_action :verify_authenticity_token, only: [:import]

  # GET /students or /students.json
  def index
    @q = Student.ransack(params[:q])
    @students = @q.result
    @images = Image.all

    if params[:search_by_firstname] && params[:search_by_firstname] != ''
      @students = @students.where('firstname ~* ?',
                                  params[:search_by_firstname])
    end
    if params[:search_by_lastname] && params[:search_by_lastname] != ''
      @students = @students.where('lastname ~* ?',
                                  params[:search_by_lastname])
    end
    if params[:search_by_recletter] && params[:search_by_recletter] != ''
      @students = @students.where('recletter ~* ?',
                                  params[:search_by_recletter])
    end
  end

  # GET /students/1 or /students/1.json
  def show
    @students = Student.all
    @Images = Image.all
  end

  # GET /students/new
  def new
    @student = Student.new
    @Images = Image.all
  end

  # GET /students/1/edit
  def edit
    @Images = Image.all
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to student_url(@student), notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy
     
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    @Images = Image.all
    @Courses = Course.all
    #begin
    Student.import(params[:file], params[:year], params[:semester], params[:files], params[:classn])
    redirect_to students_path, notice: 'Students Imported Successfully'
    #rescue
      #redirect_to students_path, notice: "No file added"
    #end
  end
  
  def help
  end

  def upload
  end

  def favor
    Student.favor(params[:lastname], params[:firstname], params[:uin], params[:email], params[:classname], params[:notes], params[:major], params[:finalgrade], params[:updatedgrade], params[:recletter], params[:semester], params[:year])
    redirect_to students_path, notice: 'Student Favorited'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def student_params
    params.require(:student).permit(:email, :firstname, :lastname, :fullname, :notes, :uin, :major, :finalgrade,
                                    :updatedgrade, :classname, :recletter, :year, :semester, :image, :student)
  end
end

