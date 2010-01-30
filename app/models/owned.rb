# Models that mix-in this module can respond to owned_by?
module Owned
  def owned_by?(user)
    self.user == user
  end
end