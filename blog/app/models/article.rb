class Article < ActiveRecord::Base
	#在删除文章时同时删除所属的评论
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: {minimum: 5}
end
