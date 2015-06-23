moment = require('moment-timezone')
geocode = require('geocode')
module.exports = (robot) ->
    robot.respond /time in (.*)/i, (res) ->
        d = new Date()
        miliTime = d.getTime();
        city = res.match[1]
        time = moment.tz(miliTime, city);
        if miliTime is not moment.tz(miliTime, "UTC"); and city is not "UTC"
            res.reply "The time in #{city} is now. In #{city} it is now #{time.format('MMMM Do YYYY, h:mm:ss a')}"
        else 
            res.reply "#{city} is not a vaid city. UTC is now #{time.format('MMMM Do YYYY, h:mm:ss a')}"