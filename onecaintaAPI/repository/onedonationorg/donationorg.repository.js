var response = require('../../shared/response');
var TYPES = require('mssql').TYPES;

function DonationOrgRepository(dbContext) {

    async function findDonationOrg(req, res, next) {


        
        if (req.params.beneId) { //ALWAYS REPLACE THIS WITH CORRECT PARAM
            var parameters = [];

            parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.beneId });

            var query = "SELECT * FROM dbo.vw_AllDonationOrganization where BeneficiaryID = @Id"

            var result = await dbContext.execQuery(query, parameters, false);

        

            if(result.rowsAffected[0] > 0)
                 {
                  
                    req.data = result.recordset[0];
                    return next();
                }
              return res.json({"message":"No item found. Item not existing"});
            
        }

    }

    function getDonationOrg(req, res) {
        return res.json(req.data);
    }

   async function getAllDonationOrg(req, res) {

        var query = "SELECT * FROM dbo.vw_AllActiveDonationOrganization";

        var result = await dbContext.execQuery(query, null, false);
       
        
       if(result.rowsAffected[0] > 0)
           {
              req.data = result.recordset;
              return res.json(req.data);
           }
            
          return res.sendStatus(404);
          
    }

    async function getAllDonationOrgAdmin(req, res) {

        var query = "SELECT BeneficiaryID,BeneficiaryName, IsActive FROM dbo.OneDonationOrganization";

        var result = await dbContext.execQuery(query, null, false);
       
        
       if(result.rowsAffected[0] > 0)
           {
              req.data = result.recordset;
              return res.json(req.data);
           }
            
          return res.sendStatus(404);
          
    }




   
   async function postDonationOrg(req, res) {
        var parameters = [];

        parameters.push({ name: 'beneficiaryname', type: TYPES.VarChar, val: req.body.BeneficiaryName});
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

         var query = "INSERT INTO dbo.OneDonationOrganization (BeneficiaryName, SystemDate,IsActive) " 
         + " VALUES (@beneficiaryname,@systemdate,@isactive)"
         + " SELECT SCOPE_IDENTITY() AS Id, 'Donation Org is Added' AS Message";

         var result = await dbContext.execQuery(query, parameters,false);


          
   
            if (result.rowsAffected[0] > 0) {
               return res.json({"message":"Donation Org Added"});
                  
               
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
   async function putDonationOrg(req, res) {
      
        var parameters = [];

        parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.beneId });
        parameters.push({ name: 'beneficiaryname', type: TYPES.VarChar, val: req.body.BeneficiaryName});
        parameters.push({ name: 'isactive', type: TYPES.VarChar, val: req.body.IsActive });
        parameters.push({ name: 'systemdate', type: TYPES.DateTime, val: new Date() });

 
        //REMOVE UNASSIGNED PARAMETERS
        parameters = parameters.filter(function (el) {
            return el.val != null;
          });


        var updateQuery="UPDATE dbo.OneDonationOrganization SET ";
        var setQuery= "";
        var WhereClause =  " WHERE BeneficiaryID = @Id";
        var query ="";

      for(var i=0; i<parameters.length;i++){

        if(parameters[i].val != null)
        {
            //console.log("INSIDE LOOP");
           // console.log(parameters[i].name);
            switch(parameters[i].name)
            {
                case "beneficiaryname":
                    setQuery +=  "BeneficiaryName= @beneficiaryname" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
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
                      return res.json({"message":"Donation Org Saved."});
                   
                    }
                 
                    return res.sendStatus(500);  //UPDATE FAILED
    }

  async function deleteDonationOrg(req, res) {
        
        var parameters = [];

        if (req.params.beneId) {
            var parameters = [];

            parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.beneId });

            var query = "delete from dbo.OneDonationOrganization where BeneficiaryID = @Id"

            var result =  await dbContext.execQuery(query, parameters, false);
               
                if (result.rowsAffected[0] > 0) { 
                   return res.json({"message":"Record is deleted"});
                }
                   return res.json({"message":"Delete failed."});
        }
        
    }


    return {
        getAllAdmin: getAllDonationOrgAdmin,
        getAll: getAllDonationOrg,
        get: getDonationOrg,
        post: postDonationOrg,
        put: putDonationOrg,
        intercept: findDonationOrg,
        delete: deleteDonationOrg
    }
}

module.exports = DonationOrgRepository;