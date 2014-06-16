class MusclesController < ApplicationController
  def index
    @muscles = Muscle.all
  end
end
