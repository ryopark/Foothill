class LessonsController < ApplicationController
  def index
    @q = Lesson.search(params[:q])
    @lessons = @q.result(distinct: true)
  end

  def show
    @lesson = Lesson.find(params[:id])
  end
end
