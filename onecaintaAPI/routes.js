const express = require('express'); 

function eRoutes() {
    const router = express.Router();
    // var users = require('./repository/users/user.routes')(router);
     var news = require('./repository/news/news.routes')(router);
     var jobs = require('./repository/jobopenings/jobsopenings.routes')(router);

    return router;
}

module.exports = eRoutes;