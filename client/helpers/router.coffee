Meteor.Router.add
	'/': 
		to: 'newPosts'
		as: 'home'

	'/best': 'bestPosts'

	'/new': 'newPosts'


	'/posts/:_id':
		to: 'postPage'
		and: (id) ->
			Session.set 'currentPostId', id

	'/posts/:_id/edit':
		to: 'postEdit'
		and: (id) ->
			Session.set 'currentPostId', id

	'/submit': 'postSubmit'

	'/files/:_id': 
		to: 'showFile'
		and: (id) ->
			Session.set 'currentFileId', id



Meteor.Router.filters
	'requirelogin': (page) ->
		if Meteor.user()
			page

		else if Meteor.loggingIn()
			'loading'
		
		else
			'accessDenied'

	'clearErrors': (page) ->
		clearErrors()
		page


Meteor.Router.filter 'requirelogin', only: 'postSubmit'
Meteor.Router.filter 'clearErrors'