class Friendship < ApplicationRecord
  belongs_to :user
  # since friend is not a class, so we are going to have to say what class friend is 
  belongs_to :friend, :class_name => 'User'
end
