class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :followers
  
  mount_uploader :avatar, AvatarUploader
  validates_size_of :avatar, maximum: 1.megabytes, message: "should weight less than 1Mbit" 

  def email_required?
    false
  end

  def email_changed?
    false
  end

  # attr_accessor :login

  # def self.find_for_database_authentication(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:login)
  #     where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  #   elsif conditions.has_key?(:username) || conditions.has_key?(:email)
  #     where(conditions.to_hash).first
  #   end
  # end
 
  validates :username, presence: true, uniqueness: {
  message: "has already been taken" } 
end
