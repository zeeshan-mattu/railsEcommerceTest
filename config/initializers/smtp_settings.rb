ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 587,
  user_name: 'zeeshan.rafi@devsinc.com',
  password: Rails.application.credentials[:SENDMAIL_PASSWORD],
  authentication: 'plain',
  enable_starttls_auto: true
}
