Recaptcha.configure do |config|
	config.public_key = ENV['CAPTCHA_PUBLIC']
	config.private_key = ENV['CAPTCHA_SECRET']
end

