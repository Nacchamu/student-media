class ApplicationMailer < ActionMailer::Base
  default to: ENV['MAIL_ADDRESS']    # 送信先アドレス
  default from: aa@gmail.com    # 送信先アドレス
  layout 'mailer'
end

