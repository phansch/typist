class PracticeController < ApplicationController
  before_action :set_practice, only: [:show, :edit, :update, :destroy]

  def new
    @practice = Practice.new
  end

  # GET /practices/1.json
  def show

  end

  # POST /users.json
  def create
    @practice = Practice.new(practice_params)
    if @practice.save
      redirect_to root_path
    else
      render @practice.errors
    end
  end

  private
    def practice_params
      params.require(:practice).permit(:user_id, :lesson_id, :wpm, :cpm)
    end

    def set_practice
      @practice = Practice.find(params[:id])
    end
end
