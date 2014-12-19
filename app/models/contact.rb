class Contact < ActiveRecord::Base
  belongs_to :user
  validates :phone, presence: true
  validates :address, presence: true
end
