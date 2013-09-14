require_relative 'magic_mvc'

MagicMVC.run :Example

module Example::Controllers
  class Index < R '/boo'
    def get
      Time.now.to_s
    end
  end
end
