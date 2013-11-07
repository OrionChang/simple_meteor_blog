root = exports ? this

root.newPostsHandle = Meteor.subscribeWithPagination 'newPosts', 5

root.bestPostsHandle = Meteor.subscribeWithPagination 'bestPosts', 5 

Deps.autorun () ->
	Meteor.subscribe 'specificPost', Session.get('currentPostId')

	Meteor.subscribe 'comments', Session.get('currentPostId')


Meteor.subscribe 'notifications'


# Deps.autorun () ->
# 	console.log "There are " + Posts.find().count() + " posts."