class User < ApplicationRecord
  before_create :confirmation_token
  has_many      :tasks
  has_many      :tasks, dependent: :destroy
  validates     :first_name, presence: true
  validates     :last_name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates     :email, presence: true, format:{ with: VALID_EMAIL_REGEX }, 
                                    uniqueness:{case_sensitive: false}
  has_secure_password
  validates     :password, presence: true, length:{ minimum: 6 }

  def full_name
    [first_name, last_name].join(' ')
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private
  def confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end