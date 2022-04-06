# frozen_string_literal: true

class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy]
  helper_method :favor
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
  end

  # GET /students/1/edit
  def edit
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

  def favor
    favorite_hash = Favorite.new
    favorite_hash.lastname = student.lastname
    favorite_hash.firstname = student.firstname
    favorite_hash.uin = student.uin
    favorite_hash.email = student.email
    favorite_hash.classname = student.classname
    favorite_hash.notes =  student.notes
    favorite_hash.major = student.major
    favorite_hash.finalgrade =  student.finalgrade
    favorite_hash.updatedgrade = student.updatedgrade
    favorite_hash.recletter = student.recletter
    favorite_hash.semester = student.semester
    favorite_hash.year = student.year
    favorite_hash.save
    redirect_to favorites_path, notice: 'Student was favorited.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def student_params
    params.require(:student).permit(:email, :firstname, :lastname, :fullname, :notes, :uin, :major, :finalgrade,
                                    :updatedgrade, :classname, :recletter, :year, :semester, :image)
  end
end
