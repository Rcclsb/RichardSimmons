moment = require('moment-timezone')
geocode = require('geocode')
module.exports = (robot) ->
    robot.respond /time in (.*)/i, (res) ->
        d = new Date()
        miliTime = d.getTime();
        city = res.match[1]
        time = moment.tz(miliTime, city);
        res.reply "The time in #{city} is now. And the time in New York is #{time.format('MMMM Do YYYY, h:mm:ss a')}"