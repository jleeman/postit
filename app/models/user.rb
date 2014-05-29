class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  has_secure_password validations: false
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 5}

  # using callbacks
  before_save :generate_slug

  # default rails to_param when passing object to path is id
  # this overrides default behaviour to use slug instead
  def to_param
    self.slug
  end

  def generate_slug
    self.slug = self.username.gsub(" ", "-").downcase
  end

end
