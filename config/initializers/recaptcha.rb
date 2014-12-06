Recaptcha.configure do |config|
  config.public_key  = ENV['CAPTCHA_PUBLIC']
  config.private_key = ENV['CAPTCHA_SECRET']
  #config.proxy = 'http://myproxy.com.au:8080'
end
