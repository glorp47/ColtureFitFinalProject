class Fan < ActiveRecord::Base
  validates :username, :password_digest, :session_token, :location_zip, presence: true
  validates :account_type, presence: true, inclusion: {in: %w(fan venue band)}
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :email, uniqueness: true, presence: true

  attr_reader :password

  has_one :band
  has_one :venue
  has_many :press_items
  has_many :images
  has_many :videos

  after_initialize :ensure_token

  def self.find_by_credentials(email, password)
    fan = Fan.find_by(email: email)
    return nil unless fan && fan.valid_password?(password)
    user
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_token!
    self.session_token = generate_token
    self.save!
    self.session_token
  end

  private
  def ensure_token
    self.session_token ||= generate_token
  end

  def generate_token
    SecureRandom.urlsafe_base64(16)
  end

end
