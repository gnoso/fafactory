PKG_VERSION = "0.0.5"

Gem::Specification.new do |s|

  s.name = 'fafactory'
  s.version = PKG_VERSION
  s.platform = Gem::Platform::RUBY
  s.description = <<-DESC.strip.gsub(/\n\s+/, " ")
    Fafactory (originally Far Away Factory) is a tool for remotely creating instances of ActiveRecord models within a service. This is useful when doing integration tests of services, because it allows you to set up the environment within the remote service from your test, rather than trying to keep an instance of the service in pristine shape.
  DESC
  s.summary = <<-DESC.strip.gsub(/\n\s+/, " ")
    Framework for creating objects in remote services.
  DESC
  
  s.files = %w(lib/fafactory.rb app/controllers/fafactories_controller.rb bin/fafactory config/routes.rb)
  s.require_path = 'lib'
  s.has_rdoc = true
  
  s.bindir = "bin"
  s.executables << "fafactory"

  s.author = "Gnoso, Inc."
  s.email = "alan@gnoso.com"
  s.homepage = "http://github.com/gnoso/fafactory"
  
  s.add_dependency('activeresource', '>= 2.0')
end