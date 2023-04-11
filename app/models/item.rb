class Item < ApplicationRecord

  belongs_to :user
  # has_one :history
  has_one_attached :image

  validates :name, { length: { maximum:40 }}
  validates :content, { length: {maximum:1000 }}
  validates :image, :name, :content, :category_id, :situation_id, :load_id, :prefecture_id, :deliveryday_id, :price, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :situation_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :load_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :deliveryday_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :price, numericality: { greater_than: 299, less_than: 10000000, only_integer: true, message:"is out of setting range" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :load
  belongs_to :prefecture
  belongs_to :deliveryday

end
