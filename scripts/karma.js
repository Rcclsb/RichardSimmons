module.exports = function(robot){
    robot.respond(/karma value (.*)/i, function(res){
        message = res.match[1]
        res.reply("You Karma Valued" + message);
    })
    
    robot.respond(/(.*)++/i, function(res){
        message = res.match[1]
        res.reply("You ++'d " + message);
    })
    
    robot.respond(/(.*)--/i, function(res){
        message = res.match[1]
        res.reply("You --'d " + message);
    })
}