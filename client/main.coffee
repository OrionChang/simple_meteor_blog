root = exports ? this

root.postsHandle = Meteor.subscribeWithPagination 'paginatedPosts', 10

Deps.autorun () ->
	Meteor.subscribe 'specificPost', Session.get('currentPostId')

	Meteor.subscribe 'comments', Session.get('currentPostId')


Meteor.subscribe 'notifications'


# Deps.autorun () ->
# 	console.log "There are " + Posts.find().count() + " posts."