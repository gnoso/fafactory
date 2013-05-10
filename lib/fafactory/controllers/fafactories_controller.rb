if Rails.env == "test"
  class FafactoriesController < ApplicationController
  
    # post a new instance of the type of model requested
    #
    # ==== parameters
    # model<string>:: the model to create a new instance of
    # data<hash>:: a hash of the attributes for the model
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
  
    # purges the test database
    def purge
    
      # disconnect the connection for active record because as the connection doesn't make it through the fork, rake task will do it's own database load, etc.
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
    
    # find the instance of a model identified by its id and return its xml
    #
    # ==== parameters
    # id<integer>:: the id of the instance to look up
    # model<string>:: the model to look up the instance for
    #  
    # ==== returns
    # model xml object
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