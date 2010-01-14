require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "password" do
    @expected.subject = 'UserMailer#password'
    @expected.body    = read_fixture('password')
    @expected.date    = Time.now

    assert_equal @expected.encoded, UserMailer.create_password(@expected.date).encoded
  end

end
