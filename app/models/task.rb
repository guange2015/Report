class Task < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :content
end
