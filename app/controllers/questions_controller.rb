class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end
  def new
    if current_user
      @question = Question.new
    else
      redirect_to root_path
    end
  end
  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
    @question = Question.find(params[:id])
  end
  def my_questions
    @questions = Question
    .where(user_id: current_user.id)
  end




private

def set_question
  @question = Question.find(params[:id])
end

def question_params
  params.require(:question).permit(:title, :user_id, :body)
end
end
