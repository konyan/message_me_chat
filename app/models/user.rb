class User < ApplicationRecord
  attr_accessor :remember_token

  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: {minimum: 3, maximum: 30}
  has_many :messages
  has_secure_password

  class << self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST
                                                  : BCrypt::Engine.cost
      BCrypt::Password.create(string,cost:cost)

    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remeber
    self.remember_token = User.new_token
    update_attribute(:remeber_digest,User.digest(remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remeber_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remeber_digest,nil)
  end
end
