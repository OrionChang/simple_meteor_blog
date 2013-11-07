Meteor.publish 'newPosts', (limit) ->
	Posts.find {}, 
		sort: 
			submitted: -1
		limit: limit


Meteor.publish 'bestPosts', (limit) ->
	Posts.find {}, 
		sort: 
			votes: -1
			commentsCount: -1
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