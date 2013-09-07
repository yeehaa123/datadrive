'use strict'

describe 'Controller: MainCtrl', () ->

  # load the controller's module
  beforeEach angular.mock.module 'ngSanitize'
  beforeEach angular.mock.module 'datadriveApp'

  MainCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl', {
      $scope: scope
    }

  it 'should attach a list of calendar events to the scope', () ->
    expect(scope.calendarEvents.length).toBe 3
