require 'active_resource'

class Fafactory < ActiveResource::Base

  # Defines a new object definition 
  def self.define(service, model, defaults)
    @definitions ||= {}
    
    model = camelize_model(model)
    
    factory = Fafactory.new(service, model, defaults)
    @definitions[service] ||= {}
    @definitions[service][model] = factory
  end
  
  # Constructs a new instance based on the given service and model
  def self.create(service, model, options)
    model = camelize_model(model)
    
    # define a blank definition if we don't already have a definition
    @definitions ||= {}
    if @definitions[service] == nil ||
        @definitions[service][model] == nil
      
      define(service, model, {})
    end
    
    @definitions[service][model].create(options)
  end
  
  # Set up a new fafactory with the given defaults
  def initialize(service, model, defaults)
    @service = service
    @model = Fafactory.camelize_model(model)
    @defaults = defaults
  end
  
  # Creates a new remote instance based on the given parameters
  def create(options)
    Fafactory.create_instance(@service, @model,
        options.merge(@defaults))[Fafactory.underscore_model(@model)]
  end
  
  # Creates a new instance of a remote model using the data provided.
  def self.create_instance(service, model, data)
    Fafactory.configure_site(service)
    result = Fafactory.post :create_instance, nil, 
        { :model => camelize_model(model), :data => data }.to_xml
    
    return Hash.from_xml(result.body)
  end
  
  def self.purge(*services)
    services.each do |service|
      Fafactory.configure_site(service)
      Fafactory.delete(:purge)
    end
    
    nil
  end
  
  # Loads an instance of a remote model based on the id given
  def self.find(service, model, id)
    Fafactory.configure_site(service)
    Fafactory.get(:find, { :model => camelize_model(model), :id => id })
  end
  
  # Clears definitions (mainly useful for testing)
  def self.clear_definitions
    @definitions = {} if defined? @definitions
  end
  
  private
  def self.configure_site(service)
    @@fafactory_config ||= YAML.load_file('config/fafactory.yml')
    
    self.site = "http://0.0.0.0:#{@@fafactory_config[service]["port"]}"
  end
  
  def self.camelize_model(model)
    model.to_s.camelize
  end
  
  def self.underscore_model(model)
    model.to_s.underscore
  end
end