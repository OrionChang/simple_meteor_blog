Template.newPosts.helpers
	options: () ->
		sort: 
			submitted: -1
		handle: newPostsHandle

Template.bestPosts.helpers
	options: () ->
		sort: 
			votes: -1
			commentsCount: -1
			submitted: -1
		handle: bestPostsHandle


Template.postsList.helpers

	postsWithRank: () ->
		i = 0
		options = 
			sort: this.sort
			limit: this.handle.limit()
		Posts.find({}, options).map (post) ->
			post._rank = i
			i += 1
			post

	posts: () ->
		Posts.find {}, 
			sort: this.sort
			limit: this.handle.limit()


	postsReady: () ->
		this.handle.ready()

	allPostsLoaded: () ->
		this.handle.ready() && 
			Posts.find().count() < this.handle.loaded()
		





Template.postsList.events
	'click .load-more': (e) ->
		e.preventDefault()
		this.handle.loadNextPage()
