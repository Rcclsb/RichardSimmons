moment = require('moment-timezone')
geocode = require('geocode')
module.exports = (robot) ->
    robot.respond /time in (.*)/i, (res) ->
        city = res.match[1]
        time = moment.tz("2013-11-18 11:55", city);
        res.reply "The time in #{city} is now. And the time in New York is #{time.format()}"