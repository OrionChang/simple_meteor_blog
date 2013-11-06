Meteor.publish 'posts', () ->
	Posts.find()


Meteor.publish 'comments', (postId) ->
	Comments.find postId: postId







Meteor.publish 'tomPosts', ()->
	Posts.find 'author' : 'Tom Coleman'

Meteor.publish 'allPosts', ()->
	Posts.find {}, fields:
					author: false