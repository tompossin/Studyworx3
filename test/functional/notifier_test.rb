require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "admin" do
    mail = Notifier.admin
    assert_equal "Admin", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "user" do
    mail = Notifier.user
    assert_equal "User", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "group" do
    mail = Notifier.group
    assert_equal "Group", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
