class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :contact
  has_many :receiver_messages, :foreign_key=>'receiver_id', :class_name => 'Message'
  has_many :sender_messages, :foreign_key=>'sender_id', :class_name => 'Message'

  accepts_nested_attributes_for :contact

  def full_name
    "#{first_name} #{last_name}"
  end
end
