Template.postSubmit.events
	'submit form': (e) ->
		e.preventDefault()

		post = 
			url: $(e.target).find('[name=url]').val()
			title: $(e.target).find('[name=title]').val()
			message: $(e.target).find('[name=message]').val()

		
		Meteor.call 'post', post, (error, id) ->
			if error 
				throwError error.reason

				if error.error == 302
					Meteor.Router.to('postPage', error.details)
				else
					Meteor.Router.to('postPage', id)
			

			Meteor.Router.to('postPage', id)