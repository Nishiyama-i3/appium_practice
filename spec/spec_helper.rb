require "appium_lib"
require "pry" if ENV['DEBUG']

SPEC_ROOT = File.expand_path(File.dirname(__FILE__))
Dir[File.expand_path('support/helpers/*.rb', SPEC_ROOT)].each { |f| require f }
Dir[File.expand_path('support/pages/*.rb', SPEC_ROOT)].each { |f| require f }


RSpec.configure do |config|
  include ConfigHelper
  config.before(:suite) do
    @driver = Appium::Driver.new(capability, true)
    @driver.start_driver
    Appium.promote_appium_methods Object
  end
  config.after(:suite) do
    @driver.driver_quit
  end

  config.after(:each) do |example|
    if example.exception
      file_path = "#{result_log_dir_name}/error-#{file_name}.png"
      @driver.screenshot file_path
      example.metadata[:failed_screenshot] = file_path
    end
    
  end
end