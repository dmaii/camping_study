module MagicMVC 
  APP_STR  = IO.read(__FILE__) rescue nil

  def self.run(app_name)
    eval (APP_STR.gsub(/Web/, app_name.to_s), TOPLEVEL_BINDING)
  end

  module Controllers
    @routes = []

    def add_route(str)
      @routes << str
    end 

  end 
end
