if Posts.find().count() == 0 

	now = new Date().getTime()

	tomId = Meteor.users.insert
		profile: name: 'Tom Coleman'

	sachaId = Meteor.users.insert
		profile: name: 'Sacha Greif'

	tom = Meteor.users.findOne(tomId)

	sacha = Meteor.users.findOne(sachaId)

	telescopeId = Posts.insert
		title: "Introducing Telescope"
		userId: sacha._id
		author: sacha.profile.name
		content: "Subscription
A subscription is a connection to a publication for a specific client. The subscription is code that runs in the browser that
talks to a publication on the server and keeps the data in sync.Helpers
When a template needs to render something more complex than a document property it can call a helper, a function that
is used to aid rendering.Template Data Context
When a template renders, it refers to a JavaScript object that provides specific data for this particular rendering. Usually
such objects are plain-old-JavaScript-objects (POJOs), often documents from a collection, although they can be more
complicated and have functions available on them."
		submitted: now - 7 * 3600 * 1000
		commentsCount: 2
		upvoters: [] 
		votes: 0

	Comments.insert
		postId: telescopeId
		userId: tom._id
		author: tom.profile.name
		submitted: now - 5 * 3000 * 1000
		body: 'Interesting project Sacha, can I get involved?'

	Comments.insert
		postId: telescopeId
		userId: sacha._id
		author: sacha.profile.name
		submitted: now - 3 * 3000 * 1000
		body: 'You sure can Tom!'

	Posts.insert
		title: 'Meteor'
		userId: tom._id
		author: tom.profile.name
		content: "Collection
A Meteor Collection is the data store that automatically synchronizes between client and server. Collections have a name
(such as posts), and usually exist both on client and server. Although they behave differently, they have a common API
based on Mongo\'s API.
MiniMongo
The client-side collection is an in-memory data store offering a Mongo-like API. The library that supports this behaviour is
called \“MiniMongo\”, to indicate it\'s a smaller version of Mongo that runs completely in memory.
Document
Mongo is a document-based data-store, so the objects that come out of collections are called “documents”. They are plain
JavaScript objects (although they can\'t contain functions) with a single special property, the _id, which Meteor uses to
track their properties over DDP."
		submitted: now - 10 * 3600 * 1000
		commentsCount: 0
		upvoters: [] 
		votes: 0
	
	Posts.insert
		title: 'The Meteor Book'
		userId: tom._id
		author: tom.profile.name
		content: "CSS & JavaScript
You might have noticed that we\'re using an .invisible CSS class to trigger the animation instead of
animating the CSS opacity property directly like we did for top. This is because for top, we needed to
animate the property to a specific value that depended on the instance data.
On the other hand, here we only want to show and hide an element independently of its data. Since it\'s a good
idea to keep your CSS out of your JavaScript as much as possible, we\'ll only add and remove the class here,
and specify the details of the animation over in our stylesheet."
		submitted: now - 12 * 3600 * 1000
		commentsCount: 0
		upvoters: [] 
		votes: 0
		
	for i in [0..9]
		Posts.insert
			title: 'Test post #' + i
			userId: sacha._id
			author: sacha.profile.name
			content: 'Test content Test content Test content Test content 
			Test content Test content Test content Test content 
			Test content Test content Test content Test content ' + i
			submitted: now - i * 3600 * 1000
			commentsCount: 0
			upvoters: [] 
			votes: 0




