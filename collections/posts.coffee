root = exports ? this

root.Posts = new Meteor.Collection 'posts'

Posts.allow
	update: ownsDocument
	remove: ownsDocument

Posts.deny
	update: (userId, post, fieldNames) ->
		_.without(fieldNames, 'title', 'content').length > 0


Meteor.methods
	post: (postAttributes) ->
		user = Meteor.user()


		if !user
			throw new Meteor.Error 401, 'You need to login to post new stories'


		if !postAttributes.title || postAttributes.title.replace(/\s+/g, '').length <= 0
			throw new Meteor.Error 422, 'Please fill in a title'

		if !postAttributes.content || postAttributes.content.replace(/\s+/g, '').length <= 0
			throw new Meteor.Error 422, 'Please fill in content'


		post = _.extend _.pick(postAttributes, 'title', 'content', 'filesId'), 
			userId: user._id
			author: user.username
			submitted: new Date().getTime()
			commentsCount: 0
			upvoters: []
			votes: 0

		

		postId = Posts.insert post


		postId

	updatePost: (postAttributes, postId) ->

		user = Meteor.user()


		if !user
			throw new Meteor.Error 401, 'You need to login to update post'
		

		if !postAttributes.title || postAttributes.title.replace(/\s+/g, '').length <= 0
			throw new Meteor.Error 422, 'Please fill in a title'

		if !postAttributes.content || postAttributes.content.replace(/\s+/g, '').length <= 0
			throw new Meteor.Error 422, 'Please fill in content'


		post = _.extend _.pick(postAttributes, 'title', 'content'), 
			updated: new Date().getTime()
			

		Posts.update {_id: postId, userId: user._id}, {$set: post}


		postId


	upvote: (postId) ->
		user = Meteor.user()		

		if !user
			throw new Meteor.Error 401, 'You need to login to upvote'

		Posts.update({
				_id: postId
				upvoters: 
					$ne: user._id


			},{

				$addToSet: 
					upvoters: user._id
				$inc:
					votes: 1

			})


			



		
		

