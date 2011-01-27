class Wiki < ActiveRecord::Base
  belongs_to :wiki_item

  validates_presence_of :content,:title
end 
