class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  def show
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.update_attributes(user_id: current_user.id)

    if @answer.save
      redirect_to @answer.question, notice: 'Answer was successfully created.'
      @answer.user.update_attribute :points, @answer.user.points + 5
    else
      redirect_to @answer.question, alert: 'Looks like you didnt succeed'
    end
  end


  def update
    if @answer.update(answer_params)
      redirect_to @answer.question
      points = @answer.user.points
      @answer.user.update_attribute :points, points+25
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:body, :question_id, :user_id, :accepted)
    end
end
