Meteor.Router.add
	'/': 'postsList'

	'/posts/:_id':
		to: 'postPage'
		and: (id) ->
			Session.set 'currentPostId', id

	'/submit': 'postSubmit'



Meteor.Router.filters
	'requirelogin': (page) ->
		if Meteor.user()
			page

		else if Meteor.loggingIn()
			'loading'
		
		else
			'accessDenied'


Meteor.Router.filter 'requirelogin', only: 'postSubmit'