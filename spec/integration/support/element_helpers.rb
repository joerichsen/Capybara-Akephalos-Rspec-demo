# Inspired by
# http://pivotallabs.com/users/patn/blog/articles/717-run-javascript-in-selenium-tests-easily-
module ElementHelpers
  class Element
    def initialize(context, selector)
      @context, @selector = context, selector
    end

    def hide!
      call(:hide)
    end

    def show!
      call(:show)
    end

    def visible?
      call(:is, ':visible') == true
    end

    private

    def call(fn, *args)
      @context.evaluate_script <<-JS
        jQuery(#{@selector.inspect}).#{fn}(#{args.map(&:inspect).join(', ')});
      JS
    end
  end

  def locate(selector)
    Element.new(self, selector)
  end
end

RSpec.configuration.include ElementHelpers, :type => :integration
