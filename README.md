Fafactory
=========

Fafactory (originally Far Away Factory) is a tool for remotely creating instances of ActiveRecord models within a service. This is useful when doing integration tests of services, because it allows you to set up the environment within the remote service from your test, rather than trying to keep an instance of the service in pristine shape.

How It Works
------------
Fafactory provides a test mode only controller that can easily create test instances of your ActiveRecord models in your services and a framework for creating those instances from within the tests of the applications that consume those services. So, for example, if you were developing an application that exposed a Widget's resource, you could create a widget using Fafactory and then test loading that widget over ActiveResource.

Installing
----------
Make sure you have gemcutter in your gem sources before you try to do the install. You can find out how to do that at http://gemcutter.org.

    gem install fafactory

Now that you've got the gem installed, you'll need to configure any service that you want to expose to Fafactory. Add a line like the following to your environment.rb:

    config.gem "fafactory", :lib => "fafactory"
    
Now, in the app that will be utilizing the Fafactory enabled service, create a file called config/fafactory.yml and define your service in YAML. You'll need to include the filesystem path to the service and the port, so your config file will have one or more entries like the following:

  test_app:
    path: ../test_app
    port: 3003

Testing With Fafactory
----------------------
Assuming you've got a model called Monkey in an app exposing Fafactory, you'll want to define some defaults for your factory first.

    Fafactory.define('test_app', :monkey, { :name => "Mongo", :age => 5, :gender => "male" })

Then, you can apply changes to your default and create them within your service.

    result = Fafactory.create('test_app', 'Monkey', { "name" => "Alan" })
      
    # now load the object through active resource, and maybe do something interesting
    monkey = Monkey.find(result["id"])
    monkey.something_interesting
    assert_equal "Mongo", monkey.name

Purging The Remote Database
---------------------------
At the beginning of each test you'll probably want to purge the databases of the services that you're testing interactions with. You can do that with:

    Fafactory.purge('test_app')
    
Finding Records
---------------
Sometimes you want to confirm something about a remote object without necessarily calling through ActiveResource, so Fafactory includes a find method that lets you find a particular model in a particular service by its id:

    Fafactory.find('test_app', :monkey, 1)

Reporting Issues
----------------
If something's not working like you expect it to, submit an issue through the GitHub issues tool for Fafactory, and I'll take a look at your problem. You can find the issues tool [here](http://github.com/gnoso/fafactory/issues).

License
-------
Copyright (c) 2009, Gnoso, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.