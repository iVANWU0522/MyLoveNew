Rails.application.configure do

  config.x.local_domain               = 'localhost:3000'
  config.x.domain                     = 'xiangyuxin.com'
  ##############################################################################
  # CLIENT SMTP SETTINGS
  ##############################################################################

  config.x.smtp_raise_delivery_errors = true #false in production
  config.x.smtp_delivery              = false #true in production only
  config.x.smtp_port                  = 587
  config.x.smtp_address               = 'smtp.gmail.com'
  config.x.smtp_authentication        = 'login'
  config.x.smtp_user_name             = ENV['MAIL_ADDRESS']
  config.x.smtp_password              = ENV['MAIL_PASSWORD']
  config.x.smtp_enable_starttls_auto  = true


  ##############################################################################
  # CLIENT EMAIL SETTINGS
  ##############################################################################

  config.x.email_contact   = 'wu0719900522@gmail.com'
  config.x.email_itsupport = 'wu0719900522@gmail.com'
  config.x.email_safety    = 'wu0719900522@gmail.com'

end