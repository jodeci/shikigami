# frozen_string_literal: true
require "rails/generators/base"
module Shikigami
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("templates", __FILE__)
    desc "Creates a locale file for your application"
    class_option :locale, default: Rails.application.config.i18n.default_locale

    def self.source_root
      @source_root ||= File.join(File.dirname(__FILE__), "templates")
    end

    def copy_locale
      copy_file "locale.yml", "config/locales/shikigami.#{options[:locale]}.yml"
    end
  end
end
