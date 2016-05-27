class User < ActiveRecord::Base

  has_secure_password

  has_many :comments, foreign_key: :commenter_id
  has_many :invitations
  has_many :memberships
  has_many :votes, foreign_key: :voter_id
  has_one :team, foreign_key: :organizer_id

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  attr_accessor :street_address, :city, :state, :zip
  before_validation :full_address, on: [:create, :update]


  def full_address
    self.full_address = "#{self.street_address}, #{self.city}, #{self.state}  #{self.zip}"
  end

end
