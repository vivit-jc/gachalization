# encoding: utf-8

require 'rails_helper'

RSpec.describe TradesHelper, :type => :helper do

  describe "verify_creating" do
    it "自分のでないカードを交易に出そうとしたらエラー" do
      pending
    end
    it "交易枠を既に一杯エラー" do
      pending
    end
  end

  describe "verify_buying" do
    it "資金が足りないエラー" do
      pending
    end
    it "自分のカードは買えないエラー" do
      pending
    end
  end

end
