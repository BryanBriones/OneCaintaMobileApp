const _policyRepository = require('./policies.repository');
const dbContext = require('../../Database/dbContext');

module.exports = function (router) {
    const policyRepository = _policyRepository(dbContext);

    router.route('/policies')
        .get(policyRepository.getAll)
        .post(policyRepository.post);
        
    router.use('/policies/:policyId', policyRepository.intercept);

    router.route('/policies/:policyId')
        .get(policyRepository.get)
        .put(policyRepository.put)
        .delete(policyRepository.delete);

    //ADMIN API ROUTES BELOW:
    
    router.route('/policiesadmin')
        .get(policyRepository.getAllAdmin);



}
