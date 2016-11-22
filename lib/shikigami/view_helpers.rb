module Shikigami
  module ViewHelpers
    def bootstrap_dropdown_toggle(title)
      content_tag :a, bootstrap_dropdown_toggle_hash do
        concat title
        concat content_tag :span, nil, class: "caret"
      end
    end
    alias_method :bs_dd_toggle, :bootstrap_dropdown_toggle

    def bootstrap_button(action, path, options = {})
      btn_options = {}
      btn_options[:class] = bootstrap_button_class(action, options)
      btn_options[:method] = options[:method] if options[:method]
      btn_options[:data] = { confirm: t("shikigami.confirm.#{action}") } if options[:confirm]
      link_to t("shikigami.actions.#{action}"), path, btn_options
    end
    alias_method :bs_btn, :bootstrap_button

    def no_data_alert(message = t("shikigami.warnings.no_data"))
      content_tag :div, message, class: "alert alert-warning"
    end

    private

    def bootstrap_button_class(action, options = {})
      size = options[:size] ? options[:size] : "xs"
      style = options[:style] ? options[:style] : bootstrap_button_style(action)
      "btn btn-#{size} btn-#{style}"
    end

    def bootstrap_button_style(action)
      case action.to_s
      when "show" then "info"
      when "edit" then "warning"
      when "destroy" then "danger"
      else "primary"
      end
    end

    def bootstrap_dropdown_toggle_hash
      {
        "class": "dropdown-toggle",
        "data-toggle": "dropdown",
        "role": "button",
        "aria-haspopup": "true",
        "aria-expanded": "false"
      }
    end
  end
end
