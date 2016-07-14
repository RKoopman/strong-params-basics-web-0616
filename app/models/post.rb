class Post < ActiveRecord::Base
  def free=(free)
    @free = free
  end
end