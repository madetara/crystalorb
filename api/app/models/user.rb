# frozen_string_literal: true

class User < ApplicationRecord
  # HACK
  # https://github.com/lynndylanhurley/devise_token_auth/issues/1276
  extend Devise::Models

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
end
