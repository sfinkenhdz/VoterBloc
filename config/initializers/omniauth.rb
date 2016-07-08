OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1349140091769015', 'fd9bd3f989dfda225b2b97b37531902a'
end