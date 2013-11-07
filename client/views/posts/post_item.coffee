Template.postItem.helpers
	ownPost: () ->
		this.userId == Meteor.userId()

	domain: () ->
		a = document.createElement 'a'
		a.href = this.url
		a.hostname


	upvotedClass: () ->
		userId = Meteor.userId()
		if userId && !_.include this.upvoters, userId
			'btn-primary upvotable'
		else
			'disabled'

Template.postItem.rendered = () ->
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


