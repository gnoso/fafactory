Fafactory
=========

Fafactory (originally Far Away Factory) is a tool for remotely creating instances of ActiveRecord models within a service. This is useful when doing integration tests of services, because it allows you to set up the environment within the remote service from your test, rather than trying to keep an instance of the service in pristine shape.

Installing
----------
Make sure you have GitHub in your gem sources before you try to do the install.

    gem install gnoso-fafactory

Now that you've got the gem installed, you'll need to configure your application to use control center. Add a line like the following to your environment.rb:

    config.gem "gnoso-fafactory", :lib => "fafactory"

Testing With Fafactory
----------------------

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