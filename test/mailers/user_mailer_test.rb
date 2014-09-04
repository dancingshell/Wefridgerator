require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "join_email" do
    mail = UserMailer.join_email
    assert_equal "Join email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
