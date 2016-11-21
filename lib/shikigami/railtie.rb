require "shikigami/view_helpers"
module Shikigami
  class Railtie < Rails::Railtie
    initializer "shikigami.view_helpers" do
      ActiveSupport.on_load( :action_view ){ include Shikigami::ViewHelpers } 
    end
  end
end
