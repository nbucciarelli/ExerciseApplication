class Exercise < ActiveRecord::Base
  has_many :exercise_muscles
  has_many :muscles, through: :exercise_muscles
end
