module UsersHelper
	def user_posted_commented
		(@user.comments.empty? ) && (@user.posts.empty?)
	end
end
