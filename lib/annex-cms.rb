require 'annex/engine'
require 'annex/config'
require 'annex/extension'
require 'annex/extensions/cancan'
require 'annex/railtie'

module Annex
  # Configuration defaults
  @config = {
    adapter: :activerecord
  }

  @valid_config_keys = @config.keys

  # Configure through hash
  def self.configure(opts = {})
    opts.each { |k,v| @config[k.to_sym] = v if @valid_config_keys.include? k.to_sym }
  end

  # Configure through yaml file
  def self.configure_with(path_to_yaml_file)
    begin
      config = YAML::load(IO.read(path_to_yaml_file))
    rescue Errno::ENOENT
      log(:warning, "YAML configuration file couldn't be found. Using defaults."); return
    rescue Psych::SyntaxError
      log(:warning, "YAML configuration file contains invalid syntax. Using defaults."); return
    end

    configure(config)
  end

  def self.config
    @config
  end
end