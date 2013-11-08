root = exports ? this

root.PostsFS = new CollectionFS('posts', { autopublish: false })


PostsFS.allow

    insert: 
    	(userId, file) ->
            true
    		# userId && file.owner == userId
    update: 
    	(userId, files, fields, modifier) ->
        	_.all files, (file) ->
            	userId == file.owner

    remove: 
    	(userId, files) ->
    		false

PostsFS.filter
	allow:
		contentTypes: ['image/*']


PostsFS.fileHandlers

    default2: (options) ->
        if options.fileRecord.len > 5000000 || options.fileRecord.contentType != 'image/jpeg'
            return null
        console.log('I am handling default2: ' + options.fileRecord.filename)
        options