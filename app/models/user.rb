class User < ApplicationRecord
  has_one :profile, :dependent => :destroy, :inverse_of => :user
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         validates_presence_of :password, :email
  def has_profile?
        profile.present? && profile.persisted?
  end

  def full_name
  	profile.full_name
  end

end
