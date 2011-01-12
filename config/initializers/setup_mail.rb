#ActionMailer::Base.default_charset = "GBK"
ActionMailer::Base.smtp_settings ={
	:address => 'mail.talkweb.com.cn',
	:domain => 'talkweb.com.cn',
	:port => '25',
	:user_name => 'huangxiaoguang',
	:password => 'china2008',
	:authentication => :login
}
ADMINEMAIL = 'huangxiaoguang@talkweb.com.cn'
