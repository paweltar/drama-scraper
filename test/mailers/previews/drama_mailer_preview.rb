# Preview all emails at http://localhost:3000/rails/mailers/drama_mailer
class DramaMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/drama_mailer/new_episode
  def new_episode
    DramaMailer.new_episode
  end

  # Preview this email at http://localhost:3000/rails/mailers/drama_mailer/new_drama_added
  def new_drama_added
    DramaMailer.new_drama_added
  end

end
