moment = require('moment-timezone')
geocode = require('geocode')
module.exports = (robot) ->
    robot.respond /time in (.*)/i, (res) ->
        d = new Date()
        miliTime = d.getTime();
        city = res.match[1]
        moment.tz.load({
            zones : [],
            links : [],
            version : '2014e'
        });
        time = moment.tz(miliTime, city);
        if moment.tz.zone(city) isnt null
            res.reply "The time in #{city} is now. In #{city} it is now #{time.format('MMMM Do YYYY, h:mm:ss a')}"
        else 
            res.reply "#{city} is not a vaid city. UTC is now #{time.format('MMMM Do YYYY, h:mm:ss a')}"
        
    robot.respond /list of times/i, (res) ->
        res.reply(moment.tz.names())