require 'digest'
require 'securerandom'
require 'mongoid'
module CustomerPortal
  class User

    include Mongoid::Document

    attr_accessor :password

    field :username
    field :hashed_password
    field :salt

    before_validation :hash_password, if: :password
    validates :password, confirmation: true
    validates :password, presence: true, if: :new_record?
    validates :password_confirmation,
              presence: true,
              if: :password

    def salt
      self[:salt] ||= SecureRandom.base64
    end

    private

    def hash_password
      self.hashed_password = Digest::SHA256.hexdigest([salt,password].join(''))
    end

  end
end