require 'active_resource'

class Fafactory < ActiveResource::Base

  # Creates a new instance of a remote model using the data provided.
  def self.create_instance(service, model, data)
    Fafactory.configure_site(service)
    result = Fafactory.post :create_instance, nil, 
        { :model => model, :data => data }.to_xml
    
    return Hash.from_xml(result.body)
  end
  
  def self.purge(*services)
    services.each do |service|
      Fafactory.configure_site(service)
      Fafactory.delete(:purge)
    end
    
    nil
  end
  
  private
  def self.configure_site(service)
    @@fafactory_config ||= YAML.load_file('config/fafactory.yml')
    
    self.site = "http://0.0.0.0:#{@@fafactory_config[service]["port"]}"
  end
end