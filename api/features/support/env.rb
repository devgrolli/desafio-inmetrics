require 'factory_bot'
require 'faker'
require 'httparty'
require 'rspec'
require 'pry'
require_relative 'spec_helper/spec_rest'

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENV['TARGET']}.yml")

World(REST,FactoryBot::Syntax::Methods)