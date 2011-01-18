class UserMailer < ActionMailer::Base
  include TasksListSystem
  
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

    @recipients << "lindianxuan@talkweb.com.cn"
    @recipients << "yzh@talkweb.com.cn"
    @recipients << "penggegang@talkweb.com.cn"
    @recipients << "liangwei@talkweb.com.cn"
    @recipients << "leiru@talkweb.com.cn"

    @from        = "huangxiaoguang@talkweb.com.cn"
    @subject     = ""
    @sent_on     = Time.now
    self.content_type = "text/html"
    @subject = "客户端"+Time.zone.today.to_s+"日报"
    get_tasks_list
  end

  def test_tasks_list
    @recipients = ["huangxiaoguang@talkweb.com.cn"]

    @from        = "huangxiaoguang@talkweb.com.cn"
    @subject     = ""
    @sent_on     = Time.now
    self.content_type = "text/html"
    @subject = "客户端"+Time.zone.today.to_s+"日报"
    get_tasks_list
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

    self.content_type = "text/plain"
  end

end
