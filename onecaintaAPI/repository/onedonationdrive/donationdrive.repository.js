var response = require('../../shared/response');
var TYPES = require('mssql').TYPES;

function DonationDriveRepository(dbContext) {

    async function findDonationDrive(req, res, next) {


        
        if (req.params.donationId) { //ALWAYS REPLACE THIS WITH CORRECT PARAM
            var parameters = [];

            parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.donationId });

            var query = "SELECT * FROM dbo.vw_AllDonationDrives where DonationID = @Id"

            var result = await dbContext.execQuery(query, parameters, false);

        

            if(result.rowsAffected[0] > 0)
                 {
                  
                    req.data = result.recordset[0];
                    return next();
                }
              return res.json({"message":"No item found. Item not existing"});
            
        }

    }

    function getDonationDrive(req, res) {
        return res.json(req.data);
    }

   async function getAllDonationDrive(req, res) {

        var query = "SELECT * FROM dbo.vw_AllActiveDonationDrives";

        var result = await dbContext.execQuery(query, null, false);
       
        
       if(result.rowsAffected[0] > 0)
           {
              req.data = result.recordset;
              return res.json(req.data);
           }
            
          return res.sendStatus(404);
          
    }

    async function getAllDonationDriveAdmin(req, res) {

        var query = "SELECT DonationID,DonationChannel, DonationChannelName, DonationChannelValue, IsActive FROM dbo.OneDonationDrive";

        var result = await dbContext.execQuery(query, null, false);
       
        
       if(result.rowsAffected[0] > 0)
           {
              req.data = result.recordset;
              return res.json(req.data);
           }
            
          return res.sendStatus(404);
          
    }




   
   async function postDonationDrive(req, res) {
        var parameters = [];

        parameters.push({ name: 'donationchannel', type: TYPES.VarChar, val: req.body.DonationChannel});
        parameters.push({ name: 'donationchannelname', type: TYPES.VarChar, val: req.body.DonationChannelName});
        parameters.push({ name: 'donationchannelvalue', type: TYPES.VarChar, val: req.body.DonationChannelValue});
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

         var query = "INSERT INTO dbo.OneDonationDrive (DonationChannel, DonationChannelName, DonationChannelValue, SystemDate,IsActive) " 
         + " VALUES (@donationchannel,@donationchannelname,@donationchannelvalue,@systemdate,@isactive)"
         + " SELECT SCOPE_IDENTITY() AS Id, 'Donation Drive is Added' AS Message";

         var result = await dbContext.execQuery(query, parameters,false);


          
   
            if (result.rowsAffected[0] > 0) {
               return res.json({"message":"Donation Drive Added"});
                  
               
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
   async function putDonationDrive(req, res) {
      
        var parameters = [];

        parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.donationId });
        parameters.push({ name: 'donationchannel', type: TYPES.VarChar, val: req.body.DonationChannel});
        parameters.push({ name: 'donationchannelname', type: TYPES.VarChar, val: req.body.DonationChannelName});
        parameters.push({ name: 'donationchannelvalue', type: TYPES.VarChar, val: req.body.DonationChannelValue});
        parameters.push({ name: 'isactive', type: TYPES.VarChar, val: req.body.IsActive });
        parameters.push({ name: 'systemdate', type: TYPES.DateTime, val: new Date() });

 
        //REMOVE UNASSIGNED PARAMETERS
        parameters = parameters.filter(function (el) {
            return el.val != null;
          });


        var updateQuery="UPDATE dbo.OneDonationDrive SET ";
        var setQuery= "";
        var WhereClause =  " WHERE DonationID = @Id";
        var query ="";

      for(var i=0; i<parameters.length;i++){

        if(parameters[i].val != null)
        {
            //console.log("INSIDE LOOP");
           // console.log(parameters[i].name);
            switch(parameters[i].name)
            {
                case "donationchannel":
                    setQuery +=  "DonationChannel= @donationchannel" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                    break;
                case "donationchannelname":
                     setQuery +=  "DonationChannelName= @donationchannelname" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                     break;
                case "donationchannelvalue":
                     setQuery +=  "DonationChannelValue= @donationchannelvalue" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
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
                      return res.json({"message":"Donation Drive Saved."});
                   
                    }
                 
                    return res.sendStatus(500);  //UPDATE FAILED
    }

  async function deleteDonationDrive(req, res) {
        
        var parameters = [];

        if (req.params.donationId) {
            var parameters = [];

            parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.donationId });

            var query = "delete from dbo.OneDonationDrive where DonationID = @Id"

            var result =  await dbContext.execQuery(query, parameters, false);
               
                if (result.rowsAffected[0] > 0) { 
                   return res.json({"message":"Record is deleted"});
                }
                   return res.json({"message":"Delete failed."});
        }
        
    }


    return {
        getAllAdmin: getAllDonationDriveAdmin,
        getAll: getAllDonationDrive,
        get: getDonationDrive,
        post: postDonationDrive,
        put: putDonationDrive,
        intercept: findDonationDrive,
        delete: deleteDonationDrive
    }
}

module.exports = DonationDriveRepository;