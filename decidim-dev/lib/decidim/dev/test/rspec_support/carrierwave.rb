RSpec.configure do |config|
  config.before(:each) do |example|
    CarrierWave.configure do |config|
      config.storage = :file
      config.enable_processing = false
    end
  end
end
