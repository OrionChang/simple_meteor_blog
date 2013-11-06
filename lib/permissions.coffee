root = exports ? this

root.ownsDocument = (userId, doc) ->
	doc && doc.userId == userId