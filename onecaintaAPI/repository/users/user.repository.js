
var response = require('../../shared/response');
var TYPES = require('mssql').TYPES;


function UserRepository(dbContext) {

   async function findUser(req, res, next) {
      
        if (req.params.email) {
            var parameters = [];

           
            parameters.push({ name: 'EmailAddress', type: TYPES.VarChar, val: req.params.email });
            var query = "select * from dbo.users where EmailAddress = @EmailAddress"

            var result = await dbContext.execQuery(query, parameters, false);
               
            if(result.rowsAffected[0] > 0) {
                  
                    req.data = result.recordset;
                    return res.json(req.data);
                }
                return  res.json('Email is not registered.');
        }
    }

    async function getUsers(req, res) {

            var query = "select * from dbo.users"

            var result = await dbContext.execQuery(query, null, false);
               
                
            if(result.rowsAffected[0] > 0) {
                  req.data = result.recordset;
                    return res.json(req.data);
                }
                return res.sendStatus(404);
        
    }

    function getUser(req, res) {
        return res.json(req.data);
    }

    async function emailExist(req)
    {
        var parameters = [];
        parameters.push({ name: 'EmailAddress', type: TYPES.VarChar, val: req.body.EmailAddress });
        var query = "select * from dbo.users where EmailAddress = @EmailAddress"

        var result =  await dbContext.execQuery(query, parameters, false);
        if(result.rowsAffected[0] > 0) {
                return true;
            }
            return false;

    }

   
    async function postUser(req, res) {

        console.log('POSTeters');
        if (await emailExist(req))

        {
            return res.json('Email already exists.');

        }

        else{
            var parameters = [];
            console.log(parameters);
            parameters.push({ name: 'FirstName', type: TYPES.VarChar, val: req.body.FirstName });
            parameters.push({ name: 'Middlename', type: TYPES.VarChar, val: req.body.Middlename });
            parameters.push({ name: 'Lastname', type: TYPES.VarChar, val: req.body.Lastname });
            parameters.push({ name: 'ProfilePic', type: TYPES.NVarChar, val: null });
            parameters.push({ name: 'EmailAddress', type: TYPES.VarChar, val: req.body.EmailAddress });
            parameters.push({ name: 'JoinDate', type: TYPES.DateTime, val: Date()});
            parameters.push({ name: 'PasswordHash', type: TYPES.NVarChar, val: req.body.PasswordHash });
            parameters.push({ name: 'PasswordSalt', type: TYPES.NVarChar, val: req.body.PasswordSalt });
            parameters.push({ name: 'UserType', type: TYPES.NVarChar, val: req.body.UserType });
            parameters.push({ name: 'VerificationSalt', type: TYPES.NVarChar, val: req.body.VerificationSalt });

             var query = "INSERT INTO dbo.users VALUES (@FirstName,@Middlename,@Lastname,@ProfilePic,@EmailAddress,@JoinDate,@PasswordSalt,@PasswordHash,@UserType,@VerificationSalt,0,0)"
             + " SELECT SCOPE_IDENTITY() AS Id, 'User is now registered.' AS Message";

             var result = await dbContext.execQuery(query, parameters,false);

             if (result.rowsAffected[0] > 0) {
                return res.json(result.recordset);
                    
                }
               
                return res.sendStatus(422);
           

        }
     
    }

    
    function addComma(index, paramslength)
    {
     console.log(index, paramslength-1);
      var toAddComma = (index == (paramslength-1) || paramslength == 1) ? false: true; 
        
      if(toAddComma)
        return ", ";
     else
        return "";

    }

    async function putUser(req, res) {
     
        var parameters = [];

        parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.userId });
        parameters.push({ name: 'FirstName', type: TYPES.VarChar, val: req.body.FirstName });
        parameters.push({ name: 'Middlename', type: TYPES.VarChar, val: req.body.Middlename });
        parameters.push({ name: 'Lastname', type: TYPES.VarChar, val: req.body.Lastname });
        parameters.push({ name: 'ProfilePic', type: TYPES.NVarChar, val: req.body.ProfilePic });
        parameters.push({ name: 'EmailAddress', type: TYPES.VarChar, val: req.body.EmailAddress });
      

     //REMOVE UNASSIGNED PARAMETERS
     parameters = parameters.filter(function (el) {
        return el.val != null;
      });


    var updateQuery="UPDATE dbo.users SET ";
    var setQuery= "";
    var WhereClause =  " WHERE UserId = @Id";
    var query ="";


        // var query = "UPDATE dbo.users SET FirstName= @FirstName ," + 
        //         "Middlename = @Middlename," +
        //         "Lastname = @LastName,"+
        //         "ProfilePic = @ProfilePic,"+
        //         "EmailAddress = @EmailAddress,"+
        //         "JoinDate = @JoinDate "+
        //         "WHERE UserId = @Id"
        
        for(var i=0; i<parameters.length;i++){

            if(parameters[i].val != null)
            {
                console.log("INSIDE LOOP");
                console.log(parameters[i].name);
                switch(parameters[i].name)
                {
                    case "FirstName":
                        setQuery +=  "FirstName= @FirstName" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                        break;
                    case "Middlename":
                         setQuery +=  "Middlename= @Middlename" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                         break;
                    case "Lastname":
                         setQuery +=  "Lastname= @Lastname" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                         break;
                    case "ProfilePic":
                        setQuery +=  "ProfilePic= @ProfilePic" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                        break;
                    case "EmailAddress":
                            setQuery +=  "EmailAddress= @EmailAddress" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                            break;
                    default:
                        break;
                    
                }
    
    
            }
        }

            query = updateQuery + setQuery + WhereClause;

            console.log(query);
      

                var result = await dbContext.execQuery(query, parameters,false);

                if (result.rowsAffected[0] > 0) {
                        return res.json('User details updated.');
                    }
                   
                    return res.sendStatus(422);
    }

    async function deleteUser(req, res) {
    
        var parameters = [];
        
        if (req.data.UserId) {
            var parameters = [];

            parameters.push({ name: 'Id', type: TYPES.Int, val: req.data.UserId });

            var query = "delete from dbo.Users where UserId = @Id"

            var result =  await dbContext.execQuery(query, parameters, false);
           
                if (result.rowsAffected[0] > 0) {
                    return res.json('Record is deleted');
                }
               
                return res.sendStatus(404);
        }
    }

    async function getUserVerify(req, res) {

        var parameters = [];
        console.log(parameters);
        parameters.push({ name: 'VerificationSalt', type: TYPES.NVarChar, val: req.params.verificationSalt });


         var query = "UPDATE dbo.Users SET IsVerified = 1 WHERE VerificationSalt = @VerificationSalt"
         var result = await dbContext.execQuery(query, parameters,false);

         if (result.rowsAffected[0] > 0) {
            return res.json('User verified');
                
            }
           
            return res.json('Account failed to verify. Please email eventifyph@gmail.com for manual verification.');

    }

    async function putUserResetCode(req, res) {
        console.log('RESET CODE');
        var parameters = [];
        console.log(parameters);
        parameters.push({ name: 'EmailAddress', type: TYPES.VarChar, val: req.params.email });
        parameters.push({ name: 'PasswordResetCode', type: TYPES.Int, val: req.body.PasswordResetCode });

         var query = "UPDATE dbo.Users SET PasswordResetCode = @PasswordResetCode WHERE EmailAddress = @EmailAddress"
         var result = await dbContext.execQuery(query, parameters,false);

         if (result.rowsAffected[0] > 0) {
            return res.json('Password Reset updated');
                
            }
           
           
            return res.sendStatus(422);

    }

    async function putNewPass(req, res) {

        var parameters = [];
        console.log(parameters);
        parameters.push({ name: 'EmailAddress', type: TYPES.VarChar, val: req.params.email });
        parameters.push({ name: 'PasswordHash', type: TYPES.NVarChar, val: req.body.PasswordHash });
        parameters.push({ name: 'PasswordSalt', type: TYPES.NVarChar, val: req.body.PasswordSalt });
        
         var query = "UPDATE dbo.Users SET PasswordHash = @PasswordHash, PasswordSalt = @PasswordSalt WHERE EmailAddress = @EmailAddress"
         var result = await dbContext.execQuery(query, parameters,false);

         if (result.rowsAffected[0] > 0) {
            return res.json('Password updated');
                
            }
           
           
            return res.sendStatus(422);

    }


    return {
        getAll: getUsers,
        get: getUser,
        post: postUser,
        postvalidate: getUser,
        put: putUser,
        getVerify: getUserVerify,
        putUserResetCode: putUserResetCode,
        putNewPass: putNewPass,
    //    getMulti: getEmployeesWothDepartment,
    //    find: SearchEmployee,
       intercept: findUser,
        delete: deleteUser
    }
}

module.exports = UserRepository;