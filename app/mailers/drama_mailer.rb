class DramaMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.drama_mailer.new_episode.subject
  #
  def new_episode
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.drama_mailer.new_drama_added.subject
  #
  def new_drama_added
    @greeting = "Hi"

    mail to: "paweltar@gmail.com"
  end
end
