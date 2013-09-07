'use strict'

describe 'Filter: markdown', () ->

  # load the filter's module
  beforeEach module 'markdown'

  # initialize a new instance of the filter before each test
  markdown = {}
  beforeEach inject ($filter) ->
    markdown = $filter 'markdown'

  it 'should return markdown input as html', () ->
    text = 'Hello from *angularjs*'
    expect(markdown text).toBe ('<p>Hello from <em>angularjs</em></p>')
