var response = require('../../shared/response');
var TYPES = require('mssql').TYPES;

function OneNegosyoRepository(dbContext) {

    async function findNegosyo(req, res, next) {


        
        if (req.params.businessId) { //ALWAYS REPLACE THIS WITH CORRECT PARAM
            var parameters = [];

            parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.businessId });

            var query = "SELECT * FROM dbo.vw_AllBusiness where BusinessID = @Id"

            var result = await dbContext.execQuery(query, parameters, false);

        

            if(result.rowsAffected[0] > 0)
                 {
                  
                    req.data = result.recordset[0];
                    return next();
                }
              return res.json({"message":"No item found. Item not existing"});
            
        }

    }

    function getNegosyo(req, res) {
        return res.json(req.data);
    }

   async function getAllNegosyo(req, res) {

        var query = "SELECT * FROM dbo.vw_AllActiveBusiness";

        var result = await dbContext.execQuery(query, null, false);
       
        
       if(result.rowsAffected[0] > 0)
           {
              req.data = result.recordset;
              return res.json(req.data);
           }
            
          return res.sendStatus(404);
          
    }

    async function getAllNegosyoAdmin(req, res) {

        var query = "SELECT BusinessID,BusinessName, OpenHours, CloseHours, BusinessDayOpen, BusinessDayClose,ContactDetails,BusinessDesc,BusinessLocation, BusinessCategory, BusinessImg, IsActive FROM dbo.OneNegosyo";

        var result = await dbContext.execQuery(query, null, false);
       
        
       if(result.rowsAffected[0] > 0)
           {
              req.data = result.recordset;
              return res.json(req.data);
           }
            
          return res.sendStatus(404);
          
    }




   
   async function postNegosyo(req, res) {
        var parameters = [];

        parameters.push({ name: 'businessname', type: TYPES.VarChar, val: req.body.BusinessName});
        parameters.push({ name: 'openhours', type: TYPES.VarChar, val: req.body.OpenHours});
        parameters.push({ name: 'closehours', type: TYPES.VarChar, val: req.body.CloseHours});
        parameters.push({ name: 'businessdayopen', type: TYPES.VarChar, val: req.body.BusinessDayOpen});
        parameters.push({ name: 'businessdayclose', type: TYPES.VarChar, val: req.body.BusinessDayClose});
        parameters.push({ name: 'contactdetails', type: TYPES.VarChar, val: req.body.ContactDetails});
        parameters.push({ name: 'businessdesc', type: TYPES.NVarChar, val: req.body.BusinessDesc});
        parameters.push({ name: 'businessloc', type: TYPES.VarChar, val: req.body.BusinessLocation});
        parameters.push({ name: 'businesscat', type: TYPES.VarChar, val: req.body.BusinessCategory});
        parameters.push({ name: 'businessimg', type: TYPES.VarChar, val: req.body.BusinessImg});
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

         var query = "INSERT INTO dbo.OneNegosyo (BusinessName, OpenHours, CloseHours, BusinessDayOpen, BusinessDayClose,ContactDetails,BusinessDesc,BusinessLocation, BusinessCategory, BusinessImg, IsActive, SystemDate) " 
         + " VALUES (@businessname,@openhours, @closehours,@businessdayopen,@businessdayclose,@contactdetails,@businessdesc, @businessloc, @businesscat,@businessimg,@isactive,@systemdate)"
         + " SELECT SCOPE_IDENTITY() AS Id, 'One Negosyo is Added' AS Message";

         var result = await dbContext.execQuery(query, parameters,false);


          
   
            if (result.rowsAffected[0] > 0) {
               return res.json({"message":"One Negosyo post is Added"});
                  
               
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
   async function putNegosyo(req, res) {
      
        var parameters = [];

        parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.businessId });
        parameters.push({ name: 'businessname', type: TYPES.VarChar, val: req.body.BusinessName});
        parameters.push({ name: 'openhours', type: TYPES.VarChar, val: req.body.OpenHours});
        parameters.push({ name: 'closehours', type: TYPES.VarChar, val: req.body.CloseHours});
        parameters.push({ name: 'businessdayopen', type: TYPES.VarChar, val: req.body.BusinessDayOpen});
        parameters.push({ name: 'businessdayclose', type: TYPES.VarChar, val: req.body.BusinessDayClose});
        parameters.push({ name: 'contactdetails', type: TYPES.VarChar, val: req.body.ContactDetails});
        parameters.push({ name: 'businessdesc', type: TYPES.NVarChar, val: req.body.BusinessDesc});
        parameters.push({ name: 'businessloc', type: TYPES.VarChar, val: req.body.BusinessLocation});
        parameters.push({ name: 'businesscat', type: TYPES.VarChar, val: req.body.BusinessCategory});
        parameters.push({ name: 'businessimg', type: TYPES.VarChar, val: req.body.BusinessImg});
        parameters.push({ name: 'isactive', type: TYPES.VarChar, val: req.body.IsActive });
        parameters.push({ name: 'systemdate', type: TYPES.DateTime, val: new Date() });


 
        //REMOVE UNASSIGNED PARAMETERS
        parameters = parameters.filter(function (el) {
            return el.val != null;
          });


        var updateQuery="UPDATE dbo.OneNegosyo SET ";
        var setQuery= "";
        var WhereClause =  " WHERE BusinessID = @Id";
        var query ="";

      for(var i=0; i<parameters.length;i++){

        if(parameters[i].val != null)
        {
            //console.log("INSIDE LOOP");
           // console.log(parameters[i].name);
            switch(parameters[i].name)
            {
                case "businessname":
                    setQuery +=  "BusinessName= @businessname" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                    break;
                case "openhours":
                     setQuery +=  "OpenHours= @openhours" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                     break;
                case "closehours":
                     setQuery +=  "CloseHours= @closehours" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                     break;
                case "businessdayopen":
                     setQuery +=  "BusinessDayOpen= @businessdayopen" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                     break;
                case "businessdayclose":
                    setQuery +=  "BusinessDayClose= @businessdayclose" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                    break;
                case "contactdetails":
                    setQuery +=  "ContactDetails= @contactdetails" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                    break;
                case "businessdesc":
                    setQuery +=  "BusinessDesc= @businessdesc" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                    break;
                case "businessloc":
                    setQuery +=  "BusinessLocation= @businessloc" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                    break;
                case "businesscat":
                    setQuery +=  "BusinessCategory= @businesscat" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                    break;
                case "businessimg":
                    setQuery +=  "BusinessImg= @businessimg" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
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
                      return res.json({"message":"One Negosyo Saved."});
                   
                    }
                 
                    return res.sendStatus(500);  //UPDATE FAILED
    }

  async function deleteNegosyo(req, res) {
        
        var parameters = [];

        if (req.params.businessId) {
            var parameters = [];

            parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.businessId });

            var query = "delete from dbo.OneNegosyo where BusinessID = @Id"

            var result =  await dbContext.execQuery(query, parameters, false);
               
                if (result.rowsAffected[0] > 0) { 
                   return res.json({"message":"Record is deleted"});
                }
                   return res.json({"message":"Delete failed."});
        }
        
    }


    return {
        getAllAdmin: getAllNegosyoAdmin,
        getAll: getAllNegosyo,
        get: getNegosyo,
        post: postNegosyo,
        put: putNegosyo,
        intercept: findNegosyo,
        delete: deleteNegosyo
    }
}

module.exports = OneNegosyoRepository;