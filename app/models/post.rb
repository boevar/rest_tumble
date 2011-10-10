class Post < ActiveRecord::Base
  validates_presence_of :message
  validates_length_of :message, :maximum => 140
end
