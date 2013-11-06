Meteor.publish 'paginatedPosts', (limit) ->
	Posts.find {}, 
		sort: 
			submitted: -1
		limit: limit


Meteor.publish 'specificPost', (id) ->
	id && Posts.find id



Meteor.publish 'comments', (postId) ->
	Comments.find postId: postId


Meteor.publish 'notifications', () ->
	Notifications.find userId: this.userId






# Meteor.publish 'tomPosts', ()->
# 	Posts.find 'author' : 'Tom Coleman'

# Meteor.publish 'allPosts', ()->
# 	Posts.find {}, fields:
# 					author: false