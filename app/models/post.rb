require 'ostruct'
class Post < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :title, :use => :slugged
  
  scope :recent_order, order('id DESC')
  
  def self.by_month(month)
    where("posts.created_at >= ? and posts.created_at < ?", month.beginning_of_month, month.end_of_month)
  end
  
  def month
    name = created_at.strftime("%B %Y")
    OpenStruct.new(:name => name, :url_name => name.downcase.gsub(" ", "-"), :date => created_at)
  end
  
end
