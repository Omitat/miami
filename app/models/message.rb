class Message
  include ActiveModel::Model
  attr_accessor :name, :email, :phone_number, :message, :contact
  validates :name, :email, :phone_number, :contact, :message, presence: true
end
