require 'test/test_helper'

class FafactoryTest < Test::Unit::TestCase
  
  test "that creating a new instance works" do
    id = Fafactory.create_instance('test_app', :monkey, 
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
      Fafactory.create_instance('test_app', :monkey, 
        { 
          "name" => "Mongo",
          "age" => 5,
          "gender" => "male"
        })["monkey"]["id"]
    end
    Fafactory.purge('test_app')
    
    assert_equal 0, Monkey.find(:all).size
  end
  
  test "that finding works" do
    monkey = Monkey.create({ :name => "Mongo" })
    
    monkey_xml_hash = Fafactory.find('test_app', :monkey, monkey.id)
    assert_equal monkey.id, monkey_xml_hash["id"]
  end
  
  test "that defining a new factory works" do
    Fafactory.define('test_app', :monkey, :name => "Mongo")
    result = Fafactory.create('test_app', 'Monkey', :age => 12)
    
    assert_equal 12, result["age"]
    assert_equal "Mongo", result["name"]
  end

  test "that that creating a new instance of an undefined factory works" do
    Fafactory.clear_definitions
    assert_equal 12, Fafactory.create('test_app', 'Monkey', :age => 12)["age"]
  end
end