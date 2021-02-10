const _oneorgRepository = require('./oneorg.repository');
const dbContext = require('../../Database/dbContext');

module.exports = function (router) {
    const oneorgRepository = _oneorgRepository(dbContext);

    router.route('/oneorg')
        .get(oneorgRepository.getAll)
        .post(oneorgRepository.post);
        
    router.use('/oneorg/:orgId', oneorgRepository.intercept);

    router.route('/oneorg/:orgId')
        .get(oneorgRepository.get)
        .put(oneorgRepository.put)
        .delete(oneorgRepository.delete);

    //ADMIN API ROUTES BELOW:
    
    router.route('/oneorgadmin')
        .get(oneorgRepository.getAllAdmin);



}
