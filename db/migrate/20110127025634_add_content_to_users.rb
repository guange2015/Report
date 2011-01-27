class AddContentToUsers < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
      t.column :content, :text
    end
  end

  def self.down
    change_table(:users) do |t|
      t.remove_column :content
    end
  end
end
