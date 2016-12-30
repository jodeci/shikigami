# frozen_string_literal: true
require "shikigami/bootstrap_button"
module Shikigami
  module ViewHelpers
    def bootstrap_dropdown_toggle(title)
      content_tag :a, bootstrap_dropdown_toggle_hash do
        concat title
        concat content_tag :span, nil, class: "caret"
      end
    end
    alias bs_dd_toggle bootstrap_dropdown_toggle

    def bootstrap_button(action, path, options = {})
      button = Shikigami::BootstrapButton.new(action, options)
      link_to t("actions.#{action}"), path, button.options
    end
    alias bs_btn bootstrap_button

    def no_data_alert(message = t("warnings.no_data"))
      content_tag :div, message, class: "alert alert-warning"
    end

    private

    def bootstrap_dropdown_toggle_hash
      {
        "class": "dropdown-toggle",
        "data-toggle": "dropdown",
        "role": "button",
        "aria-haspopup": "true",
        "aria-expanded": "false",
      }
    end
  end
end
