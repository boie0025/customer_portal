require 'digest'
require 'securerandom'
module CustomerPortal
  class User
    include Mongoid::Document
    field :username
    field :hashed_password
    field :salt

    before_save :hash_password
    validates :password, confirmation: true

    private

    def hash_password
      Digest::SHA256.new

    end

    def generate_salt
      self.salt ||= SecureRandom.base64
    end

  end
end