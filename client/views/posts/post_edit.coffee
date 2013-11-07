Template.postEdit.helpers
	post: () ->
		Posts.findOne Session.get('currentPostId')


Template.postEdit.events

	'submit form': (e) ->
		e.preventDefault()
		currentPostId = Session.get 'currentPostId'
		postProperties = 
			title: $(e.target).find('[name=title]').val()
			content: $(e.target).find('[name=content]').val()

		
		Meteor.call 'updatePost', postProperties, currentPostId, (error, id) ->
			if error 
				throwError error.reason
			else
				Meteor.Router.to('postPage', id)

	# 'submit form': (e) ->
	# 	e.preventDefault()
	# 	currentPostId = Session.get 'currentPostId'
	# 	postProperties = 
	# 		title: $(e.target).find('[name=title]').val()
	# 		content: $(e.target).find('[name=content]').val()
		
	# 	Posts.update currentPostId, {$set: postProperties}, (error) ->
	# 		if error
	# 			alert error.reason
	# 		else 
	# 			Meteor.Router.to 'postPage', currentPostId 
				
			
	
	'click .delete': (e) ->
		e.preventDefault()
		
		if confirm("Delete this post?")
			currentPostId = Session.get 'currentPostId'
			Posts.remove currentPostId
			Meteor.Router.to 'newPosts'