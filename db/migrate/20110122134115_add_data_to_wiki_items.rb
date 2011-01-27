class AddDataToWikiItems < ActiveRecord::Migration
  def self.up
    WikiItem.create(:name => "symbian")
    WikiItem.create(:name => "kjava")
    WikiItem.create(:name => "android")
    WikiItem.create(:name => "winmobile")
    WikiItem.create(:name => "应用")
    WikiItem.create(:name => "其他")
  end

  def self.down
    WikiItem.delete_all
  end
end
