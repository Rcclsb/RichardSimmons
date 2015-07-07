module.exports = function(robot){
    robot.respond(/karma value (.*)/i, function(res){
        res.reply("You Karma Valued");
    })
}