require "rspec"
require "pry"

$LOAD_PATH.unshift File.expand_path('spec/*')
$LOAD_PATH.unshift File.expand_path('lib/*')

require "email_predictor"
include EmailPredictor

def test_console
  binding.pry if ENV['CONSOLE'] == 'true'
end

RSpec.configure do |config|

  config.after(:suite) do
    test_console
  end
end
