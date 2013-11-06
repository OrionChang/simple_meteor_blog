Meteor.subscribe 'posts'


Deps.autorun () ->
	Meteor.subscribe 'comments', Session.get('currentPostId')

Meteor.subscribe 'notifications'


Deps.autorun () ->
	console.log "There are " + Posts.find().count() + " posts."