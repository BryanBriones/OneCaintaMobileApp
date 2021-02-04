const _newsRepository = require('./news.repository');
const dbContext = require('../../Database/dbContext');

module.exports = function (router) {
    const newsRepository = _newsRepository(dbContext);

    router.route('/news')
        .get(newsRepository.getAll)
        .post(newsRepository.post);
        
    router.use('/news/:newsId', newsRepository.intercept);

    router.route('/news/:newsId')
        .get(newsRepository.get)
        .put(newsRepository.put)
        .delete(newsRepository.delete);

    //ADMIN API ROUTES BELOW:
    
    router.route('/newsadmin')
        .get(newsRepository.getAllAdmin);



}
