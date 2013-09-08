'use strict'
@app.config ['$httpProvider', ($httpProvider) ->
  $httpProvider.defaults.useXDomain = true
  delete $httpProvider.defaults.headers.common['X-Requested-With']
]

@app.controller 'MainCtrl', ['$scope', '$http', ($scope, $http) ->

  # calUrl = 'http://www.google.com/calendar/feeds/codingthehumanities.com_dn72sr4rqo2jd1j4srv5glknm8%40group.calendar.google.com/private-5db17e9d796b1aa3af7756124455ca42/full?orderby=starttime&sortorder=ascending&max-results=3&futureevents=true&alt=json'

  $http.get('events/events.json').success (data) ->
    console.log data
    $scope.calendarEvents = data.feed.entry
    console.log $scope.calendarEvents
]
