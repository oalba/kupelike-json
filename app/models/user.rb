class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :place
  belongs_to :role

  # attr_accessor :password, :password_confirmation
  # validates_presence_of :name
  before_save :assign_role

  def admin?
    self.role.name == "Admin"
  end

  def assign_role
    self.role = Role.find_by name: "Seller" if self.role.nil?
  end

  def seller?
    self.role.name == "Seller"
  end

  # def regular?
  #   self.role.name == "Regular"
  # end
end
