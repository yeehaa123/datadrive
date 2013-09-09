'use strict'
@app.config ['$httpProvider', ($httpProvider) ->
  $httpProvider.defaults.useXDomain = true
  delete $httpProvider.defaults.headers.common['X-Requested-With']
]

@app.controller 'MainCtrl', ['$scope', '$http', ($scope, $http) ->

  calUrl = 'http://www.google.com/calendar/feeds/codingthehumanities.com_dn72sr4rqo2jd1j4srv5glknm8%40group.calendar.google.com/private-5db17e9d796b1aa3af7756124455ca42/full?orderby=starttime&sortorder=ascending&max-results=3&futureevents=true&alt=json'

  $http.get(calUrl).success (data) ->
    rawEvents = data.feed.entry
    console.log rawEvents
    calendarEvents = rawEvents.map (event) ->
      title: event.title.$t
      startTime: event.gd$when[0].startTime
      endTime: event.gd$when[0].endTime
      location: event.gd$where[0].valueString
      description: event.content.$t
    console.log calendarEvents
    $scope.calendarEvents = calendarEvents
]
