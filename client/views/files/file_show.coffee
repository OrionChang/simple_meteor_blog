Template.showFile.helpers
	currentFile: () ->
		PostsFS.findOne(Session.get 'currentFileId')