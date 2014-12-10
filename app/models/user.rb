class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :received_messages, :foreign_key => :receiver, :class => 'Message'
  has_many :sent_messages, :foreign_key => :sender, :clas => 'Message'
  def full_name
    "#{first_name} #{last_name}"
  end
end
