Template.postItem.helpers
	ownPost: () ->
		this.userId == Meteor.userId()

	upvotedClass: () ->
		userId = Meteor.userId()
		if userId && !_.include this.upvoters, userId
			'upvotable'
		else
			'disabled'

	file: () ->
		if this.filesId && this.filesId.length > 0
			PostsFS.findOne this.filesId[0]

	isPostPage: () ->
		Meteor.Router.page() == "postPage"

	linkToPost: () ->

		html = "<a href='/posts/"
		html += this._id
		html += "'>Read more </a>"
	

Template.postItem.rendered = () ->

	instance = this
	console.log instance.currentPosition

	instance = this
	rank = instance.data._rank
	$this = $(this.firstNode)
	postHeight = 80
	newPosition = rank * postHeight

	if typeof(instance.currentPosition) != 'undefined'
		previousPosition = instance.currentPosition

		delta = previousPosition - newPosition

		$this.css "top", delta + "px"
	else
		$this.addClass "invisible"

	Meteor.defer () ->
		instance.currentPosition = newPosition

		$this.css("top", "0px").removeClass "invisible"

Template.postItem.events
	'click .upvote': (e) ->
		e.preventDefault()
		Meteor.call 'upvote', this._id


