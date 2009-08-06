require 'test/test_helper'

class FafactoryTest < Test::Unit::TestCase
  
  test "that creating a new instance works" do
    id = Fafactory.create_instance('test_app', 'Monkey', 
        { 
          "name" => "Mongo",
          "age" => 5,
          "gender" => "male"
        })["monkey"]["id"]
        
    monkey = Monkey.find(id)
    assert_equal "Mongo", monkey.name
  end
  
  test "that purging works" do
    10.times do
      Fafactory.create_instance('test_app', 'Monkey', 
        { 
          "name" => "Mongo",
          "age" => 5,
          "gender" => "male"
        })["monkey"]["id"]
    end
    Fafactory.purge('test_app')
    
    assert_equal 0, Monkey.find(:all).size
  end
end