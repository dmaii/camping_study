require_relative 'magic_mvc'

MagicMVC.run :Example

module Example::Controllers
  class Index 
    def get
      Time.now.to_s
    end
  end
end
