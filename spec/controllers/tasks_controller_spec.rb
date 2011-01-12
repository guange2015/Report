require 'spec_helper'
include AuthenticatedTestHelper

describe TasksController do
  render_views
  
  before(:each) do
    @user = User.new(:login => 'huangxiaoguang',
                     :email => 'huangxiaoguang@talkweb.com.cn',
                     :password => '123456',
                     :password_confirmation => '123456')
    @user.register!
    @user.activate!
    login_as(@user)
  end
  
  describe "index" do
    it 'should not finished when have not report' do
      get :index
      assigns(:finished).should be_eql false
    end
    it 'should finished when have report' do
      Task.create!(:user => @user, :content=>'content')
      get :index
      assigns(:finished).should be_eql true
    end
  end
end