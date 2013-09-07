'use strict';

angular.module('markdown', [])
  .filter 'markdown', () ->
    converter = new Showdown.converter()
    (input) ->
      converter.makeHtml(input)
