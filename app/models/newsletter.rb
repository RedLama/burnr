class Newsletter < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}
end
