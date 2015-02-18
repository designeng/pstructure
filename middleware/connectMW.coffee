path = require "path"
Chance = require "chance"

randomRange = (num1, num2) ->
    Math.floor(Math.random() * (num2 - num1)) + num1 + 1

ConnectMW = {}

ConnectMW.folderMount = (connect, point) ->
    return connect.static path.resolve(point)

ConnectMW.randomService = (req, res, next) ->
    if (req.url).match new RegExp("service/random")

        airports = []
        body = 
            airports: []

        chance = new Chance()

        for num in [1..200]
            range = randomRange(0, 10)
            innerList = []
            for i in [0..range]
                innerList.push {id: i, name: chance.name(), hash: chance.hash({length: 7}) }
            body.airports.push {id: num, port: chance.name(), chance: chance.word({length: 7}), location: chance.coordinates(), innerList: innerList }

        res.setHeader "Content-Type", "application/json; charset=utf-8"
        res.write JSON.stringify body
        res.end()

    else
        next()

module.exports = ConnectMW