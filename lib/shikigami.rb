# frozen_string_literal: true
require "bundler/setup"
require "shikigami/version"
require "shikigami/railtie" if defined?(Rails)
require "shikigami/engine"
module Shikigami
end
