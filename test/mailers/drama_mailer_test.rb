require 'test_helper'

class DramaMailerTest < ActionMailer::TestCase
  test "new_episode" do
    mail = DramaMailer.new_episode
    assert_equal "New episode", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "new_drama_added" do
    mail = DramaMailer.new_drama_added
    assert_equal "New drama added", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
