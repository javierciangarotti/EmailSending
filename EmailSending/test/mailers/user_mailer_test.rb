require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "sign_upconfirmation" do
    mail = UserMailer.sign_upconfirmation
    assert_equal "Sign upconfirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
