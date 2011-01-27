#coding=utf-8
namespace :db  do
  desc "user all"
  task :userall=>:environment do
    p User.all
  end
  
  desc "add test user"
  task :testuser => :environment do
    @user = User.new(:login => 'liuqaing',
                     :name => '刘强',
                     :email => 'liuqaing@talkweb.com.cn',
                     :password => '123456',
                     :password_confirmation => '123456')
    @user.register!
    @user.activate!

    @user = User.new(:login => 'tangxiaohui',
                     :name => '唐晓慧',
                     :email => 'tangxiaohui@talkweb.com.cn',
                     :password => '123456',
                     :password_confirmation => '123456')
    @user.register!
    @user.activate!

    @user = User.new(:login => 'liangwentao',
                     :name => '梁文涛',
                     :email => 'liangwentao@talkweb.com.cn',
                     :password => '123456',
                     :password_confirmation => '123456')
    @user.register!
    @user.activate!
  end
end