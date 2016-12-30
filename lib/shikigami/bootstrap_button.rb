# frozen_string_literal: true
require "i18n"
require "active_support/core_ext/hash"
module Shikigami
  class BootstrapButton
    def initialize(action, options = {})
      @action = action.to_s
      @options = options
    end

    def options
      {
        class: default_class,
        method: @options[:method],
        data: confirm_message,
      }.compact!
    end

    private

    def size
      @options[:size] || "xs"
    end

    def style
      @options[:style] || default_style
    end

    def confirm_message
      { confirm: default_message } if @options[:confirm]
    end

    def default_message
      I18n.t("confirm.#{@action}")
    end

    def default_class
      "btn btn-#{size} btn-#{style}"
    end

    def default_style
      case @action
      when "show" then "info"
      when "edit" then "warning"
      when "destroy" then "danger"
      else "primary"
      end
    end
  end
end
