Cloudinary.config do |config|
    config.cloud_name = Figaro.env.cloudinary_name
    config.api_key = Figaro.env.cloud_key
    config.api_secret = Figaro.env.cloud_secret
    config.secure = true
    config.cdn_subdomain = true
  end