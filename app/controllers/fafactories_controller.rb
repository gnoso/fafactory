if Rails.env == "test"
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
          render :xml => obj, :status => :created
        end
      end
    end
  
    # Purges the test database
    def purge
    
      # We have to disconnect the connection for active record because the
      # connection doesn't make it through the fork, and the rake task will
      # do it's own database load, etc anyway
      dbconfig = ActiveRecord::Base.remove_connection
      pid = fork do
      
        require 'rake'
        require 'rake/testtask'
        require 'rake/rdoctask'

        require 'tasks/rails'
      
      
        Rake::Task['db:test:load'].invoke
      end
      ActiveRecord::Base.establish_connection(dbconfig)
      Process.wait(pid)
    
      respond_to do |format|
        format.xml { head :ok }
      end
    end
    
    # Find the instance of model identified by id and return it's xml.
    #
    # ==== Parameters
    # id<Integer>:: The id of the instance to look up.
    # model<String>:: The model to look up the instance for.
    #  
    # ==== Returns
    # 
    def find
      obj = Module.const_get(params[:model].to_sym).find(params[:id])
      respond_to do |format|
        format.xml do
          render :xml => obj
        end
      end
    end
  end
end