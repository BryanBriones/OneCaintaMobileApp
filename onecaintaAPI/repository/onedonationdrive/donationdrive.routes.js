const _donationdriveRepository = require('./donationdrive.repository');
const dbContext = require('../../Database/dbContext');

module.exports = function (router) {
    const donationdriveRepository = _donationdriveRepository(dbContext);

    router.route('/donationdrive')
        .get(donationdriveRepository.getAll)
        .post(donationdriveRepository.post);
        
    router.use('/donationdrive/:donationId', donationdriveRepository.intercept);

    router.route('/donationdrive/:donationId')
        .get(donationdriveRepository.get)
        .put(donationdriveRepository.put)
        .delete(donationdriveRepository.delete);

    //ADMIN API ROUTES BELOW:
    
    router.route('/donationdriveadmin')
        .get(donationdriveRepository.getAllAdmin);



}
