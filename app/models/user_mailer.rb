class UserMailer < ActionMailer::Base
  def password(email, password)
    subject    'UserMailer#password'
    recipients email
    from       'schoolproject.09.10'
    sent_on    Time.now
    
    body       :password=>password
  end

end
