class User < ApplicationRecord
  has_one :address
  has_secure_password
  
  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA256.hexdigest(token.to_s)
  end

  enum gender: {
    "---":0,
    '男性':1, '女性':2
  }

end

