const _onenegosyo = require('./onenegosyo.repository');
const dbContext = require('../../Database/dbContext');

module.exports = function (router) {
    const oneNegosyoRepository = _onenegosyo(dbContext);

    router.route('/onenegosyo')
        .get(oneNegosyoRepository.getAll)
        .post(oneNegosyoRepository.post);
        
    router.use('/onenegosyo/:businessId', oneNegosyoRepository.intercept);

    router.route('/onenegosyo/:businessId')
        .get(oneNegosyoRepository.get)
        .put(oneNegosyoRepository.put)
        .delete(oneNegosyoRepository.delete);

    //ADMIN API ROUTES BELOW:
    
    router.route('/onenegosyoadmin')
        .get(oneNegosyoRepository.getAllAdmin);



}
