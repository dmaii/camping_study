module MagicMVC
  class Server < Rack::Server
    class Options
      def parse!(args)
        require 'debugger'; debugger;
        args = args.dup
        # hard coding this until later
        r = {:environment=>"development", 
                           :pid=>nil, 
                           :Port=>3301, 
                           :Host=>"localhost", 
                           :AccessLog=>[] 
        } 
        r[:script] = args.shift
        r
      end 
    end 

    def call(env)
      puts env
      [200, {'Content-Type' => 'text/plain'}, ['I will be a big strong app someday!']]
    end 

    def public_dir
      File.expand_path('../public') 
    end

    def opt_parser
      Options.new
    end

    def default_options
      super.merge({
        :Port => 3301,
        #:database => Options::DB
      })
    end

    def app
      # The public directory is designed for static content
      Rack::Cascade.new([Rack::File.new(public_dir), self], [405, 404, 403])
    end 

    def start
      puts 'starting server'
      puts options
      super
    end 
  end 
end 
