Meteor.publish 'posts', () ->
	Posts.find()


Meteor.publish 'comments', () ->
	Comments.find()







Meteor.publish 'tomPosts', ()->
	Posts.find 'author' : 'Tom Coleman'

Meteor.publish 'allPosts', ()->
	Posts.find {}, fields:
					author: false