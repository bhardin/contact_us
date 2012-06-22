class Contact < ActiveRecord::Base
  attr_accessible :email, :name, :subject

  before_save { self.email.downcase! }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  PHONE_REGEX       = /\A\(?\d{3}[\) \.\-]{,2}\d{3}[\.\- ]?\d{4}\z/

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  validates :name, presence: true, length: { maximum: 50 }
  validates :subject, presence: true
end
