class Speak < ActiveRecord::Base
  attr_accessible :content, :title
  validates :title , :uniqueness => true, :presence => true
  validates :content, :presence => true, :length => { :minimum => 20, :maximum=> 300 }
end
