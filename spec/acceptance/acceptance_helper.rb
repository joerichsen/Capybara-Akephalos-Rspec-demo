require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require "steak"
require 'capybara/rails'

module Steak::Capybara
  include Rack::Test::Methods
  include Capybara
  include ActionView::Helpers::UrlHelper

  def app
    ::Rails.application
  end
end

RSpec.configuration.include Steak::Capybara, :type => :acceptance

# Put your acceptance spec helpers inside /spec/acceptance/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
