'use strict'
@app.config ['$httpProvider', ($httpProvider) ->
  $httpProvider.defaults.useXDomain = true
  delete $httpProvider.defaults.headers.common['X-Requested-With']
]

@app.controller 'MainCtrl', ['$scope', '$http', ($scope, $http) ->

  calUrl = 'http://www.google.com/calendar/feeds/codingthehumanities.com_dn72sr4rqo2jd1j4srv5glknm8%40group.calendar.google.com/private-5db17e9d796b1aa3af7756124455ca42/full?orderby=starttime&sortorder=ascending&max-results=3&futureevents=true&alt=json'

  $http.get(calUrl).success (data) ->
    console.log data
]
  # $scope.calendarEvents = [
  #   name: "Kickoff Event"
  #   location: "Spuistraat 210"
  #   when: "2013-09-17"
  #   description: "Bla Bla Bla"
  # ,
  #   name: "Test Two"
  #   location: "Spuistraat 210"
  #   when: "2013-09-24"
  #   description: "Bla Bla Bla"
  # ,
  #   name: "Test Three"
  #   location: "Spuistraat 210"
  #   when: "2013-09-28"
  #   description: "Bla *Bla* Bla"
  # ]
