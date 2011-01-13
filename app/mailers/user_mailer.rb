class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'
    @url  = "http://192.168.140.50:3000/activate/#{user.activation_code}"
    logger.debug "user === "+ user.inspect
    logger.debug "activate url = #{@url}"
  end

  def tasks_list
    @recipients = []
    User.all.each do |user|
	@recipients << user.email if user.active?
    end
    @from        = "huangxiaoguang@talkweb.com.cn"
    @subject     = ""
    @sent_on     = Time.now

    @subject = "tasks list"
     @tasks = Task.where(:created_at => Time.zone.today..(Time.zone.today+1.day))
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    @url  = "http://192.168.140.50:3000/"
  end
  
  protected

  def setup_email(user)
    @recipients  = "#{user.email}"
    @from        = "huangxiaoguang@talkweb.com.cn"
    @subject     = ""
    @sent_on     = Time.now
    @user = user
  end

end
