'use strict'

describe 'Controller: MainCtrl', () ->

  # load the controller's module
  beforeEach angular.mock.module 'ngSanitize'
  beforeEach angular.mock.module 'datadriveApp'

  MainCtrl = {}
  scope = {}
  $httpBackend = {}

  # Initialize the controller and a mock scope
  beforeEach inject (_$httpBackend_, $controller, $rootScope) ->
    $httpBackend = _$httpBackend_
    $httpBackend.expectGET('events/events.json').
      respond 
        feed :
          entry : [
            title: "Test 1"
          ,
            title: "Test 2"
          ,
            title: "Test 3"
          ]

    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl', {
      $scope: scope
    }

  it 'should attach a list of calendar events to the scope', () ->
    expect(scope.calendarEvents).toBeUndefined
    $httpBackend.flush()

    expect(scope.calendarEvents.length).toBe 3
