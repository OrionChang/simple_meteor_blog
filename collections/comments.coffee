root = exports ? this

root.Comments = new Meteor.Collection 'comments'

Meteor.methods
	comment: (commentAttributes) ->

		user = Meteor.user()
		post = Posts.findOne(commentAttributes.postId)


		if !commentAttributes.body
			throw new Meteor.Error(422, 'Please write some content')
		if !commentAttributes.postId
			throw new Meteor.Error(422, 'You must comment on a post')




		if user
			comment = _.extend _.pick(commentAttributes, 'postId', 'body'), 
				submitted: new Date().getTime()
				userId: user._id
				author: user.username
		else
			comment = _.extend _.pick(commentAttributes, 'postId', 'body'), 
				submitted: new Date().getTime()
				author: "Someone"

		Posts.update comment.postId, $inc: commentsCount: 1

	
		comment._id = Comments.insert(comment)

		createCommentNotification comment

		comment._id
