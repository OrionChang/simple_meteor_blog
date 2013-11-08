Meteor.methods
  saveFile: (blob, name, path, encoding) ->
    console.log "begin"
    path = path
    fs = Npm.require 'fs'
    name = name
    encoding = encoding || 'binary'
    chroot = Meteor.chroot || 'public'

    path = chroot + '/'

    console.log bolb
    
    fs.writeFile "public/" + name, blob, encoding, (err) ->
      if err
        throw (new Meteor.Error(500, 'Failed to save file.', err))
      else
        console.log('The file ' + name + ' (' + encoding + ') was saved to ' + path)

  fileUpload: (fileInfo, fileData) ->
      fs = Npm.require 'fs'
      console.log("received file " + fileInfo.name + " data: " + fileData)
      fs.writeFile "/home/rvmedtech/projects/simple_blog/public/" + fileInfo.name, fileData, "binary", (err) ->
        if err
          throw (new Meteor.Error(500, 'Failed to save file.', err))
        else
          console.log('The file ' + fileInfo.name + ' was saved to ')