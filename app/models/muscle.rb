class Muscle < ActiveRecord::Base
  has_many :exercise_muscles
  has_many :exercises, through: :exercise_muscles
end
