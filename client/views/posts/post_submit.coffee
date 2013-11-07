Template.postSubmit.events
	'submit form': (e) ->
		e.preventDefault()

		post = 
			title: $(e.target).find('[name=title]').val()
			content: $(e.target).find('[name=content]').val()

		
		Meteor.call 'post', post, (error, id) ->
			if error 
				throwError error.reason
			else
				Meteor.Router.to('newPosts', id)