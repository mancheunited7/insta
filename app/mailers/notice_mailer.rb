class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_picture.subject
  #
  def sendmail_picture
    @greeting = "Hi"

    mail to: "mancheunited7@gmail.com"
    subject: '【insta】投稿されました'
  end
end
