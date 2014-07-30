class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new]

  def index
    @questions = Question.paginate(page: params[:page], per_page: 10)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Question.find(params[:id]).answers.build
  end

  def new
    @question = current_user.questions.build
    @categories = Category.all.map { |u| [u.name, u.id] }
  end

  # # GET /questions/1/edit
  # def edit
  # end

  # POST /questions
  # POST /questions.json

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
       redirect_to @question, notice: 'Question was successfully created.'
    else
       render action: 'new', alert: 'Few errors prohibited the form from being submitted'
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :body, :category_id)
    end
end
