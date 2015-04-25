class window.Search

  constructor: (@selector) ->
    @node = $(@selector)
    @node.on('change', @search)
    @node.on('keyup', @search)

  search: () =>
    query = @node.val()
    regex = @_to_regexp(query)
    $('.list__book').each ->
      text = $(@).text()
      if regex.test(text) then $(@).removeClass('hidden') else $(@).addClass('hidden')

  _to_regexp: (str) =>
    query = str.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&"); # Cleans for regex use
    RegExp(query, 'i')