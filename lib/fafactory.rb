require 'active_resource'

class Fafactory < ActiveResource::Base
  self.site = "http://0.0.0.0:3000/"
  
  # Creates a new instance of a remote model using the data provided.
  def self.create_instance(model, data)
    result = Fafactory.post :create_instance, nil, 
        { :model => model, :data => data }.to_xml
    
    return Hash.from_xml(result.body)
  end
end