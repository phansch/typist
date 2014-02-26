class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /lessons/1
  # GET /lessons/1.json
  def show

  end

  def index
    @lessons = Lesson.all
    respond_with(@lessons)
  end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

end
