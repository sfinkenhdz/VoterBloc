class User < ActiveRecord::Base

  #has_secure_password

  has_many :comments, foreign_key: :commenter_id
  has_many :invitations
  has_many :memberships
  has_many :votes, foreign_key: :voter_id
  has_one :team, foreign_key: :organizer_id

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :email, presence: true, uniqueness: true
  # validates :username, presence: true, uniqueness: true

  attr_accessor :street_address, :city, :state, :zip
  before_validation :full_address, on: [:create, :update]

  def self.omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.image = auth.info.image
      user.token = auth.credentials.token
      user.expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def full_address
    self.full_address = "#{self.street_address}, #{self.city}, #{self.state}  #{self.zip}"
  end

  def registered
    if self.voter_registration_status == 1
      "Registered"
    else
      "Not Registered"
    end
  end
end
