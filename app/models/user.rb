class User < ApplicationRecord
    has_secure_password

    validates :name_id, {presence: true, uniqueness: true, length: {minimum: 4, maximum: 16}}
    validates :password, {presence: true, length: {minimum: 8, maximum: 16}}
end
