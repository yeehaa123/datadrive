describe 'Data Drive App', ->
  describe 'Event List View', ->
    beforeEach ->
      browser().navigateTo '/'

    it "should be on the homepage", ->
      expect(browser().location().url()).toBe '/'

    it "should filter the list of events", ->
      expect(repeater('.event').count()).toBe 3
      
      input('query').enter('data')
      expect(repeater('.event').count()).toBe 1

      input('query').enter('test')
      expect(repeater('.event').count()).toBe 2

    it "should display the current filter within an element with #status", ->
      expect(element('#status').text()).toMatch /filter: \s*$/
