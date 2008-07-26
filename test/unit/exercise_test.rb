require File.dirname(__FILE__) + '/../test_helper'


class ExerciseTest < ActiveSupport::TestCase

  fixtures :exercises
  
  def test_exercises
    shoulder_press = Exercise.new :name => shoulder_press(:name),
                                  :description => shoulder_press(:description)
    assert shoulder_press.save
    
    shoulder_press_copy = Exercise.find_by_name(shoulder_press.name)
    
    assert_equal shoulder_press.name, shoulder_press_copy.name
    
    shoulder_press.name = 'dumbell shoulder press'
    
    assert shoulder_press.save
    assert shoulder_press.destroy
    
  end

end
