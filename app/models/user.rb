class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :generate_magic_link_token

  def generate_magic_link_token
    self.magic_link_token = SecureRandom.hex(10)
    self.magic_link_token_expires_at = 1.hour.from_now
    save!
  end

  def magic_link_token_valid?
    magic_link_token_expires_at.present? && magic_link_token_expires_at > Time.current
  end

  def self.find_by_magic_link_token(token)
    find_by(magic_link_token: token)
  end
end
