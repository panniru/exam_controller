CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJS622QRAWPIIXE5Q',
    :aws_secret_access_key  => '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'
    # :region                 => ENV['S3_REGION'] # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = 'rbvrruploads'
end
