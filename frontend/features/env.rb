require 'capybara'
require 'capybara/cucumber'
require 'pry'
require 'selenium-webdriver'
require 'site_prism'
require 'yaml'

Capybara.register_driver :site_prism do |app|
  options = Selenium::WebDriver::Chrome::Options.new(args: ['window-size=1280,800'])
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

URL = YAML.load_file(File.dirname(__FILE__) + "/support/config/ambiente.yml")
DATA_MANAGER = YAML.load_file(File.dirname(__FILE__) + '/support/massas/massas_dados.yml')

Capybara.configure do |config|
  config.default_driver = :site_prism
  config.app_host = URL['urls']
end

Capybara.default_max_wait_time = 20

$login_manager = DATA_MANAGER['logins']
$cadastro_manager = DATA_MANAGER['cadastros']
$mensagem_manager = DATA_MANAGER['mensagens']