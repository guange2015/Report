class CreateWikiItems < ActiveRecord::Migration
  def self.up
    create_table :wiki_items do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :wiki_items
  end
end
