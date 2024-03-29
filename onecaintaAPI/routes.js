const express = require('express'); 

function eRoutes() {
    const router = express.Router();
    // var users = require('./repository/users/user.routes')(router);
     var news = require('./repository/news/news.routes')(router);
     var jobs = require('./repository/jobopenings/jobsopenings.routes')(router);
     var negosyo = require('./repository/onenegosyo/onenegosyo.routes')(router);
     var donationdrive = require('./repository/onedonationdrive/donationdrive.routes')(router);
     var donationorg = require('./repository/onedonationorg/donationorg.routes')(router);
     var contacts = require('./repository/contactdetails/contactdetails.routes')(router);
     var policy = require('./repository/FAQpolicies/policies.routes')(router);
     var oneorg = require('./repository/oneorg/oneorg.routes')(router);


    return router;
}

module.exports = eRoutes;