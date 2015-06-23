moment = require('moment-timezone')
geocode = require('geocode')
module.exports = (robot) ->
    robot.respond /time in (.*)/i, (res) ->
        d = new Date()
        miliTime = d.getTime();
        city = res.match[1]
        prefix = ""
        moment.tz.load({
            zones : [],
            links : [],
            version : '2014e'
        });
        time = moment.tz(miliTime, city);
        if moment.tz.zone("America/"+city) isnt null
            prefix = "America/"
        else if moment.tz.zone("Asia/"+city) isnt null
            prefix = "Asia/"
        else if moment.tz.zone("Europe/"+city) isnt null
            prefix = "Europe/"
        else if moment.tz.zone("Indian/"+city) isnt null
            prefix = "Indian/"
        else if moment.tz.zone("Australia/"+city) isnt null
            prefix = "Australia/"
        else 
            prefix = ""
            
        time = moment.tz(miliTime, prefix+city);
        
        if moment.tz.zone(prefix+city) isnt null
            res.reply "The time in #{city} is now. In #{city} it is now #{time.format('MMMM Do YYYY, h:mm:ss a')}"
        else 
            res.reply "#{city} is not a vaid city. UTC is now #{time.format('MMMM Do YYYY, h:mm:ss a')}"
        
    robot.respond /list of times/i, (res) ->
        res.reply(moment.tz.names())