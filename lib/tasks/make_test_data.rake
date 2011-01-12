namespace :db  do
  desc "user all"
  task :userall=>:environment do
    p User.all
  end
  
  desc "add test user"
  task :testuser => :environment do
    @user = User.new(:login => 'huangxiaoguang',
                     :email => 'huangxiaoguang@talkweb.com.cn',
                     :password => '123456',
                     :password_confirmation => '123456')
    @user.register!
    @user.activate!
  end
end