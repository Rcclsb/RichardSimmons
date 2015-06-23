module.exports = (robot) ->
    robot.respond /time in (.*)/i, (res) ->
        city = res.match[1]
        if city is "New York"
            res.reply "Honestly?"
        else
            res.reply "The time in #{city} is now."