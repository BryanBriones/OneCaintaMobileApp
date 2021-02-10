var response = require('../../shared/response');
var TYPES = require('mssql').TYPES;

function ContactRepository(dbContext) {

    async function findContacts(req, res, next) {


        
        if (req.params.contactId) { //ALWAYS REPLACE THIS WITH CORRECT PARAM
            var parameters = [];

            parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.contactId });

            var query = "SELECT * FROM dbo.vw_AllContactInformation where ContactID = @Id"

            var result = await dbContext.execQuery(query, parameters, false);

        

            if(result.rowsAffected[0] > 0)
                 {
                  
                    req.data = result.recordset[0];
                    return next();
                }
              return res.json({"message":"No item found. Item not existing"});
            
        }

    }

    function getContacts(req, res) {
        return res.json(req.data);
    }

   async function getAllContacts(req, res) {

        var query = "SELECT * FROM dbo.vw_AllActiveContactInformation";

        var result = await dbContext.execQuery(query, null, false);
       
        
       if(result.rowsAffected[0] > 0)
           {
              req.data = result.recordset;
              return res.json(req.data);
           }
            
          return res.sendStatus(404);
          
    }

    async function getAllContactsAdmin(req, res) {

        var query = "SELECT ContactID,ContactType, ContactAgency, ContactAgencyName, ContactValue, IsActive FROM dbo.ContactInformation";

        var result = await dbContext.execQuery(query, null, false);
       
        
       if(result.rowsAffected[0] > 0)
           {
              req.data = result.recordset;
              return res.json(req.data);
           }
            
          return res.sendStatus(404);
          
    }




   
   async function postContacts(req, res) {
        var parameters = [];

        parameters.push({ name: 'contacttype', type: TYPES.VarChar, val: req.body.ContactType});
        parameters.push({ name: 'contactagency', type: TYPES.VarChar, val: req.body.ContactAgency});
        parameters.push({ name: 'contactagencyname', type: TYPES.VarChar, val: req.body.ContactAgencyName});
        parameters.push({ name: 'contactvalue', type: TYPES.VarChar, val: req.body.ContactValue});
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

         var query = "INSERT INTO dbo.ContactInformation (ContactType, ContactAgency, ContactAgencyName, ContactValue,SystemDate,IsActive) " 
         + " VALUES (@contacttype,@contactagency,@contactagencyname,@contactvalue,@systemdate,@isactive)"
         + " SELECT SCOPE_IDENTITY() AS Id, 'ContactInfo is Added' AS Message";

         var result = await dbContext.execQuery(query, parameters,false);


          
   
            if (result.rowsAffected[0] > 0) {
               return res.json({"message":"Contact Added"});
                  
               
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
   async function putContacts(req, res) {
      
        var parameters = [];

        parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.contactId });
        parameters.push({ name: 'contacttype', type: TYPES.VarChar, val: req.body.ContactType});
        parameters.push({ name: 'contactagency', type: TYPES.VarChar, val: req.body.ContactAgency});
        parameters.push({ name: 'contactagencyname', type: TYPES.VarChar, val: req.body.ContactAgencyName});
        parameters.push({ name: 'contactvalue', type: TYPES.VarChar, val: req.body.ContactValue});
        parameters.push({ name: 'isactive', type: TYPES.VarChar, val: req.body.IsActive });
        parameters.push({ name: 'systemdate', type: TYPES.DateTime, val: new Date() });

 
        //REMOVE UNASSIGNED PARAMETERS
        parameters = parameters.filter(function (el) {
            return el.val != null;
          });


        var updateQuery="UPDATE dbo.ContactInformation SET ";
        var setQuery= "";
        var WhereClause =  " WHERE ContactID = @Id";
        var query ="";

      for(var i=0; i<parameters.length;i++){

        if(parameters[i].val != null)
        {
            //console.log("INSIDE LOOP");
           // console.log(parameters[i].name);
            switch(parameters[i].name)
            {
                case "contacttype":
                    setQuery +=  "ContactType= @contacttype" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                    break;
                case "contactagency":
                     setQuery +=  "ContactAgency= @contactagency" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                     break;
                case "contactagencyname":
                     setQuery +=  "ContactAgencyName= @contactagencyname" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                     break;
                case "contactvalue":
                    setQuery +=  "ContactValue= @contactvalue" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
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
                      return res.json({"message":"Contact Saved."});
                   
                    }
                 
                    return res.sendStatus(500);  //UPDATE FAILED
    }

  async function deleteContacts(req, res) {
        
        var parameters = [];

        if (req.params.contactId) {
            var parameters = [];

            parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.contactId });

            var query = "delete from dbo.ContactInformation where ContactId = @Id"

            var result =  await dbContext.execQuery(query, parameters, false);
               
                if (result.rowsAffected[0] > 0) { 
                   return res.json({"message":"Record is deleted"});
                }
                   return res.json({"message":"Delete failed."});
        }
        
    }


    return {
        getAllAdmin: getAllContactsAdmin,
        getAll: getAllContacts,
        get: getContacts,
        post: postContacts,
        put: putContacts,
        intercept: findContacts,
        delete: deleteContacts
    }
}

module.exports = ContactRepository;