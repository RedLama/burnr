class Article < ActiveRecord::Base

  translates :title, :content

  belongs_to :user

  scope :published, -> { where( status: "published") }
  scope :archived, -> { where( status: "archived") }
  scope :draft, -> { where( status: "draft") }

end
