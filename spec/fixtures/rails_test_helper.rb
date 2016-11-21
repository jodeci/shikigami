# monkey patching instead of creating a dummy app
require "ostruct"
module Shikigami
  class RailsTestHelper
    include Shikigami::ViewHelpers
    include ActionView::Helpers
    include ActionView::Context

    # we only need to return "content" for testing purposes
    def content_for(name, content = nil, options = {}, &block)
      if content || block_given?
        if block_given?
          options = content if content
          content = capture(&block)
        end
      end
    end
  end
end
