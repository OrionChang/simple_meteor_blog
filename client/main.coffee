Meteor.subscribe 'allPosts'



Deps.autorun () ->
	console.log "There are " + Posts.find().count() + " posts."