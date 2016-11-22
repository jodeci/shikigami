# monkey patching instead of creating a dummy app
module Shikigami
  class RailsTestHelper
    include Shikigami::ViewHelpers
    include ActionView::Helpers
    include ActionView::Context
  end
end
