const _userRepository = require('./user.repository');
const dbContext = require('../../Database/dbContext');

module.exports = function (router) {
    const userRepository = _userRepository(dbContext);

    router.route('/users')
        .get(userRepository.getAll)
        .post(userRepository.post); 

     router.use('/users/:email', userRepository.intercept);

    router.route('/users/:email')
        .get(userRepository.get)
        .delete(userRepository.delete);

    router.route('/userupdate/:userId')
              .put(userRepository.put);
    
    router.route('/userverification/:verificationSalt')
            .get(userRepository.getVerify);

    router.route('/passwordreset/:email')
             .put(userRepository.putUserResetCode);

    router.route('/updatenewpass/:email')
          .put(userRepository.putNewPass);
   

}
