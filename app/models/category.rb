class Category < ActiveRecord::Base

  has_many :subcategories, dependent: :destory
  has_many :listings, dependent: :destory

end