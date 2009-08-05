class FafactoriesController < ApplicationController
  
  # POST a new instance of the type of model requested
  #
  # ==== Parameters
  # model<String>:: The model to create a new instance of
  # data<Hash>:: A hash of the attributes for the model
  def create_instance
    obj = Module.const_get(params["hash"]["model"].to_sym).new
    
    params["hash"]["data"].each do |key, value|
      obj.send(:"#{key}=", value)
    end
    
    obj.save!
      
    respond_to do |format|
      format.xml do
        render :xml => obj, :status => :created, :location => obj
      end
    end
  end
end