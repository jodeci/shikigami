# frozen_string_literal: true
require "rails/generators/base"
module Shikigami
  MissingLocaleError = Class.new(Thor::Error)

  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("templates", __FILE__)
    desc "Creates a locale file for your application"
    class_option :locale

    def self.source_root
      @source_root ||= File.join(File.dirname(__FILE__), "templates")
    end

    def copy_locale
      copy_file "locale.yml", "config/locales/shikigami.#{locale}.yml"
    end

    private

    def locale
      if options[:locale].nil?
        Rails.application.config.i18n.default_locale
      elsif options[:locale].strip.size == 6
        raise MissingLocaleError, "please specify locale: rails generate --locale zh-TW"
      else
        options[:locale]
      end
    end
  end
end
