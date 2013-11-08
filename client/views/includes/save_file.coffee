Meteor.saveFile = (blob, name, path, type, callback) ->
  fileReader = new FileReader()
  method =  encoding = 'binary'

  type = type || 'binary'
  
  switch type
    when 'text'
      method = 'readAsText'
      encoding = 'utf8'
      break
    when 'binary'
      method = 'readAsBinaryString'
      encoding = 'binary'
      break;
    else
      method = 'readAsBinaryString'
      encoding = 'binary'
      break;

  fileReader.onload = (file) ->
    Meteor.call('saveFile', file.srcElement.result, name, path, encoding, callback)
  
  fileReader.readAsBinaryString(blob)