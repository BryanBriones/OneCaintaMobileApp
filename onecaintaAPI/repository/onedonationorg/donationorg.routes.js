const _donationorgRepository = require('./donationorg.repository');
const dbContext = require('../../Database/dbContext');

module.exports = function (router) {
    const donationorgRepository = _donationorgRepository(dbContext);

    router.route('/donationorg')
        .get(donationorgRepository.getAll)
        .post(donationorgRepository.post);
        
    router.use('/donationorg/:beneId', donationorgRepository.intercept);

    router.route('/donationorg/:beneId')
        .get(donationorgRepository.get)
        .put(donationorgRepository.put)
        .delete(donationorgRepository.delete);

    //ADMIN API ROUTES BELOW:
    
    router.route('/donationorgadmin')
        .get(donationorgRepository.getAllAdmin);



}
