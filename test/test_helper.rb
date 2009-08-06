require 'test/unit'
require 'active_resource'
require 'lib/fafactory'

class Test::Unit::TestCase
  # test "verify something" do
  #   ...
  # end
  def self.test(name, &block)
    test_name = "test_#{name.gsub(/\s+/,'_')}".to_sym
    defined = instance_method(test_name) rescue false
    raise "#{test_name} is already defined in #{self}" if defined
    if block_given?
      define_method(test_name, &block)
    else
      define_method(test_name) do
        flunk "No implementation provided for #{name}"
      end
    end
  end
end

class Monkey < ActiveResource::Base
  self.site = "http://0.0.0.0:3003"
end