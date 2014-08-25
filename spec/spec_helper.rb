require "rspec"
require "pry"

$LOAD_PATH.unshift File.expand_path('spec/*')
$LOAD_PATH.unshift File.expand_path('lib/*')

require "email_predictor"
include EmailPredictor

RSpec.configure do |config|
end
