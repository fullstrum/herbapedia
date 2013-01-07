class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstName, :lastName, :email, :password, :password_confirmation, :remember_me, :group_ids
       

  has_many :user_groups
  has_many :groups, :through => :user_groups         

  accepts_nested_attributes_for :user_groups


end
