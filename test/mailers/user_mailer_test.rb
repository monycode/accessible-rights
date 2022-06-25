require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "new_answer" do
    mail = UserMailer.new_answer
    assert_equal "New answer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
