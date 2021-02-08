const _jobsopenings = require('./jobsopenings.repository');
const dbContext = require('../../Database/dbContext');

module.exports = function (router) {
    const jobsRepository = _jobsopenings(dbContext);

    router.route('/jobopenings')
        .get(jobsRepository.getAll)
        .post(jobsRepository.post);
        
    router.use('/jobopenings/:jobsId', jobsRepository.intercept);

    router.route('/jobopenings/:jobsId')
        .get(jobsRepository.get)
        .put(jobsRepository.put)
        .delete(jobsRepository.delete);

    //ADMIN API ROUTES BELOW:
    
    router.route('/jobopeningsadmin')
        .get(jobsRepository.getAllAdmin);



}
