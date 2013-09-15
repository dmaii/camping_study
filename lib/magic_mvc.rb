$:.unshift File.dirname(__FILE__) + "/../rack/lib"

require 'rack'
require 'rack/showexceptions'
require_relative 'server'

class Object
  def meta_def(method, &b)
    # Instantiates and returns a singleton class of itself
    singleton_clazz = (class<<self; self end)

    # Defines a method on that class
    singleton_clazz.send(:define_method, method, &b)
  end 
end 

module MagicMVC 
  # Converts this current file into a string, ignore exceptions
  APP_STR  = IO.read(__FILE__) rescue nil

  def self.run(app_name)
    # runs the app, replacing all mentions of MagicMVC with app_name
    a = eval(APP_STR.gsub(/MagicMVC/, app_name.to_s) , TOPLEVEL_BINDING)
  end

  module Controllers
    @routes = []

    def self.generate_route(str)
      @routes << str
    end 
  end 

end

