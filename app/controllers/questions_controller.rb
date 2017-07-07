class QuestionsController < ApplicationController
  def index
  	@question = Question.all
  end

  def show
  	@question = Question.find(params[:id])
  end

  def new
  	@question = Question.new
  end

  def create
  	@question = Question.new(params.require(:question).permit(:title, :body, :resolved))
  	if @question.save
  		flash[:notice] = "Question has been saved."
  		redirect_to @question
  	else
  		flash[:error] = "ERROR: unable to save question. Try again."
  		render :new
  	end
  end

  def edit
  	@question = Question.find(params[:id])
  end

  def update
  	@question = Question.find(params[:id])
  	if @question.update_attributes(params.require(:question).permit(:title, :body, :resolved))
  		flash[:notice] = "Question has been updated."
  		redirect_to @question
  	else
  		flash[:error] = "ERROR: unable to update question. Try again."
  		render :edit
  	end
  end

  def destroy
  	@question = Question.find(params[:id])
  	if @question.destroy
  		flash[:notice] = "\"#{@question.title}\" has been deleted."
  		redirect_to questions_path
  	else
  		flash[:error] = "ERROR: unable to delete question"
  		render :show
  	end
  end
end
