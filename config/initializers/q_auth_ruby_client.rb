QAuthRubyClient.configure do |config|
  config.q_app_name = "Q-Careers"
  config.default_redirect_url_after_sign_in = "/users/dashboard"
  config.default_redirect_url_after_sign_out = "/"
end