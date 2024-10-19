class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :reactions
  has_many :comments
  has_many :sent_chat_requests, foreign_key: "from_user_id", class_name: "ChatRequest"
  has_many :recieved_chat_requests, foreign_key: "to_user_id", class_name: "ChatRequest" 

  validates :username, presence: true, uniqueness: true 

  def pending_recieved_chat_requests
    recieved_chat_requests.where(accepted: nil)
  end
end
