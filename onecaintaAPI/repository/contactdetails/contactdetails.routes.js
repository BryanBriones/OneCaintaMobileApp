const _contactRepository = require('./contactdetails.repository');
const dbContext = require('../../Database/dbContext');

module.exports = function (router) {
    const contactRepository = _contactRepository(dbContext);

    router.route('/contacts')
        .get(contactRepository.getAll)
        .post(contactRepository.post);
        
    router.use('/contacts/:contactId', contactRepository.intercept);

    router.route('/contacts/:contactId')
        .get(contactRepository.get)
        .put(contactRepository.put)
        .delete(contactRepository.delete);

    //ADMIN API ROUTES BELOW:
    
    router.route('/contactsadmin')
        .get(contactRepository.getAllAdmin);



}
