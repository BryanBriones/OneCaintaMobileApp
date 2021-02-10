var response = require('../../shared/response');
var TYPES = require('mssql').TYPES;

function OneOrgRepository(dbContext) {

    async function findOneOrg(req, res, next) {


        
        if (req.params.orgId) { //ALWAYS REPLACE THIS WITH CORRECT PARAM
            var parameters = [];

            parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.orgId });

            var query = "SELECT * FROM dbo.vw_AllOneOrganization where OrgID = @Id"

            var result = await dbContext.execQuery(query, parameters, false);

        

            if(result.rowsAffected[0] > 0)
                 {
                  
                    req.data = result.recordset[0];
                    return next();
                }
              return res.json({"message":"No item found. Item not existing"});
            
        }

    }

    function getOneOrg(req, res) {
        return res.json(req.data);
    }

   async function getAllOneOrg(req, res) {

        var query = "SELECT * FROM dbo.vw_AllActiveOneOrganization";

        var result = await dbContext.execQuery(query, null, false);
       
        
       if(result.rowsAffected[0] > 0)
           {
              req.data = result.recordset;
              return res.json(req.data);
           }
            
          return res.sendStatus(404);
          
    }

    async function getAllOneOrgAdmin(req, res) {

        var query = "SELECT OrgID,MunicipalGovOffice, MunicipalGovNames,MunicipalGovDesc,MunicipalImg,IsActive FROM dbo.OneOrganization";

        var result = await dbContext.execQuery(query, null, false);
       
        
       if(result.rowsAffected[0] > 0)
           {
              req.data = result.recordset;
              return res.json(req.data);
           }
            
          return res.sendStatus(404);
          
    }




   
   async function postOneOrg(req, res) {
        var parameters = [];

        parameters.push({ name: 'municipalgovoffice', type: TYPES.VarChar, val: req.body.MunicipalGovOffice});
        parameters.push({ name: 'municipalgovnames', type: TYPES.VarChar, val: req.body.MunicipalGovNames});
        parameters.push({ name: 'municipalgovdesc', type: TYPES.VarChar, val: req.body.MunicipalGovDesc});
        parameters.push({ name: 'municipalimg', type: TYPES.VarChar, val: req.body.MunicipalImg});
        parameters.push({ name: 'isactive', type: TYPES.VarChar, val: req.body.IsActive });
        parameters.push({ name: 'systemdate', type: TYPES.DateTime, val: new Date() });

        for(var i=0; i<parameters.length;i++){

            if(parameters[i].val == null)
            {
                console.log(parameters[i].name +'is missing. Insert failed.');
                return res.json({"message":"Insert failed, parameters missing."});
                
            }

        }

        //CONTINUE  WITH INSERT

         var query = "INSERT INTO dbo.OneOrganization (MunicipalGovOffice, MunicipalGovNames,MunicipalGovDesc,MunicipalImg, SystemDate,IsActive) " 
         + " VALUES (@municipalgovoffice,@municipalgovnames, @municipalgovdesc,@municipalimg,@systemdate,@isactive)"
         + " SELECT SCOPE_IDENTITY() AS Id, 'One Org is Added' AS Message";

         var result = await dbContext.execQuery(query, parameters,false);


          
   
            if (result.rowsAffected[0] > 0) {
               return res.json({"message":"One Org Added"});
                  
               
            }
           
         return res.json({"message":"Insert failed. Might be API issue check logs."});
      
    }

    function addComma(index, paramslength)
    {

      var toAddComma = (index == (paramslength-1) || paramslength == 1) ? false: true; 
        
      if(toAddComma)
        return ", ";
     else
        return "";

    }
   async function putOneOrg(req, res) {
      
        var parameters = [];

        parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.orgId });
        parameters.push({ name: 'municipalgovoffice', type: TYPES.VarChar, val: req.body.MunicipalGovOffice});
        parameters.push({ name: 'municipalgovnames', type: TYPES.VarChar, val: req.body.MunicipalGovNames});
        parameters.push({ name: 'municipalgovdesc', type: TYPES.VarChar, val: req.body.MunicipalGovDesc});
        parameters.push({ name: 'municipalimg', type: TYPES.VarChar, val: req.body.MunicipalImg});
        parameters.push({ name: 'isactive', type: TYPES.VarChar, val: req.body.IsActive });
        parameters.push({ name: 'systemdate', type: TYPES.DateTime, val: new Date() });

 
        //REMOVE UNASSIGNED PARAMETERS
        parameters = parameters.filter(function (el) {
            return el.val != null;
          });


        var updateQuery="UPDATE dbo.OneOrganization SET ";
        var setQuery= "";
        var WhereClause =  " WHERE OrgID = @Id";
        var query ="";

      for(var i=0; i<parameters.length;i++){

        if(parameters[i].val != null)
        {
            //console.log("INSIDE LOOP");
           // console.log(parameters[i].name);
            switch(parameters[i].name)
            {
                case "municipalgovoffice":
                    setQuery +=  "MunicipalGovOffice= @municipalgovoffice" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                    break;
                case "municipalgovnames":
                     setQuery +=  "MunicipalGovNames= @municipalgovnames" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                     break;
                case "municipalgovdesc":
                     setQuery +=  "MunicipalGovDesc= @municipalgovdesc" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                    break;
                case "municipalimg":
                      setQuery +=  "MunicipalImg= @municipalimg" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                     break;
                case "isactive":
                    setQuery +=  "IsActive= @isactive" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                    break;
                case "systemdate":
                        setQuery +=  "SystemDate= @systemdate" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                    break;
                default:
                    break;
                
            }


        }
        

      }

      query = updateQuery + setQuery + WhereClause;

      console.log(query);
      console.log(req.params);

                var result = await dbContext.execQuery(query, parameters,false);
                console.log(result);
                console.log(parameters);
                if (result.rowsAffected[0] > 0) {
                      return res.json({"message":"One Org Saved."});
                   
                    }
                 
                    return res.sendStatus(500);  //UPDATE FAILED
    }

  async function deleteOneOrg(req, res) {
        
        var parameters = [];

        if (req.params.orgId) {
            var parameters = [];

            parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.orgId });

            var query = "delete from dbo.OneOrganization where OrgID = @Id"

            var result =  await dbContext.execQuery(query, parameters, false);
               
                if (result.rowsAffected[0] > 0) { 
                   return res.json({"message":"Record is deleted"});
                }
                   return res.json({"message":"Delete failed."});
        }
        
    }


    return {
        getAllAdmin: getAllOneOrgAdmin,
        getAll: getAllOneOrg,
        get: getOneOrg,
        post: postOneOrg,
        put: putOneOrg,
        intercept: findOneOrg,
        delete: deleteOneOrg
    }
}

module.exports = OneOrgRepository;