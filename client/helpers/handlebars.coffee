root = exports ? this

root.Handlebars.registerHelper 'pluralize', (n, thing) ->

	if n == 1
		'1 ' + thing;
	else
		n + ' ' + thing + 's'

root.Handlebars.registerHelper 'truncateText', (text, length, link) ->

	if text.length <= length
		text
	else
		text.substring(0,length) + "..." + link


root.Handlebars.registerHelper 'friendlyTime', (time) ->
	d = new Date time
	d.toLocaleTimeString() + " - " + d.toLocaleDateString()
