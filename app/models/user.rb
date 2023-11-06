class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_reader :password
  attr_writer :password_confirmation

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: 'author_id'



  validates :password, presence: true, if: Proc.new { |u| u.password_digest.blank? }
  validates :password, confirmation: true

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }

  def admin?
    is_a?(Admin)
  end

  def user_tests(test_level)
    tests.where(level: test_level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def password=(password_string)
    if password_string.nil?
    elsif password_string.present?
      @password = password_string
      password_digest = password_digest(password_string)
    end
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end

end
