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
        else if moment.tz.zone("Mexico/"+city) isnt null
            prefix = "Mexico/"
        else if moment.tz.zone("Pacific/"+city) isnt null
            prefix = "Pacific/"
        else if moment.tz.zone("US/"+city) isnt null
            prefix = "US/"
        else if moment.tz.zone("Etc/"+city) isnt null
            prefix = "Etc/"
        else if moment.tz.zone("Brazil/"+city) isnt null
            prefix = "Brazil/"
        else if moment.tz.zone("Canada/"+city) isnt null
            prefix = "Canada/"
        else 
            prefix = ""
            
        time = moment.tz(miliTime, prefix+city);
        
        if moment.tz.zone(prefix+city) isnt null
            res.reply "In #{city} it is now #{time.format('MMMM Do YYYY, h:mm:ss a')}"
        else 
            res.reply "#{city} is not a vaid city. UTC is now #{time.format('MMMM Do YYYY, h:mm:ss a')}. If it is within a small country try typing the country."
        
    robot.respond /list of times/i, (res) ->
        res.reply(moment.tz.names())