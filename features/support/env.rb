require "capybara/cucumber"
require "selenium-webdriver"
require "site_prism"
require "byebug"
require "faker"
require "cpf_faker"
require "dotenv"
require "httparty"
require "base64"
require "httparty/request"
require "httparty/response/headers"
require "rspec"
require "rspec/expectations"

if ENV["ENV"]
  puts "Iniciando o teste no ambiente"
  Dotenv.load("environment/.env." + ENV["ENV"], ".env")
else
  Dotenv.load(".env")
end

Capybara.register_driver :chrome_headless do |app|
  args = %w[--enable-javascript no-sandbox window-size=1440,900 headless disable-gpu --disable-dev-shm-usage --remote-debugging-port=9222]

  caps = Selenium::WebDriver::Remote::Capabilities.chrome(
    "chromeOptions" => {
      "args" => args,
    },
  )

  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: caps)
end

Capybara.configure do |config|
  config.default_driver = (ENV["DRIVER"] || "selenium_chrome").to_sym
  config.default_max_wait_time = 60
end