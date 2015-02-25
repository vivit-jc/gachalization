class Money < ActiveRecord::Base
  belongs_to :player

  def add(v)
    self.pt += v
    self.save
  end

  # マイナスになったときのことは後で考える
  # 基本的にはマイナスになる操作を行わないようにする
  def sub(v)
    self.pt -= v
    self.save
  end
end
