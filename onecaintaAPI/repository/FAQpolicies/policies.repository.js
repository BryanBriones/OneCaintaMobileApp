var response = require('../../shared/response');
var TYPES = require('mssql').TYPES;

function PolicyRepository(dbContext) {

    async function findPolicies(req, res, next) {


        
        if (req.params.policyId) { //ALWAYS REPLACE THIS WITH CORRECT PARAM
            var parameters = [];

            parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.policyId });

            var query = "SELECT * FROM dbo.vw_AllPoliciesFAQGuidelines where PolicyID = @Id"

            var result = await dbContext.execQuery(query, parameters, false);

        

            if(result.rowsAffected[0] > 0)
                 {
                  
                    req.data = result.recordset[0];
                    return next();
                }
              return res.json({"message":"No item found. Item not existing"});
            
        }

    }

    function getPolicies(req, res) {
        return res.json(req.data);
    }

   async function getAllPolicies(req, res) {

        var query = "SELECT * FROM dbo.vw_AllActivePoliciesFAQGuidelines";

        var result = await dbContext.execQuery(query, null, false);
       
        
       if(result.rowsAffected[0] > 0)
           {
              req.data = result.recordset;
              return res.json(req.data);
           }
            
          return res.sendStatus(404);
          
    }

    async function getAllPoliciesAdmin(req, res) {

        var query = "SELECT PolicyID,Question, AnswerBody, IsActive FROM dbo.PoliciesFAQGuidelines";

        var result = await dbContext.execQuery(query, null, false);
       
        
       if(result.rowsAffected[0] > 0)
           {
              req.data = result.recordset;
              return res.json(req.data);
           }
            
          return res.sendStatus(404);
          
    }




   
   async function postPolicies(req, res) {
        var parameters = [];

        parameters.push({ name: 'question', type: TYPES.VarChar, val: req.body.Question});
        parameters.push({ name: 'answerbody', type: TYPES.VarChar, val: req.body.AnswerBody});
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

         var query = "INSERT INTO dbo.PoliciesFAQGuidelines (Question, AnswerBody, SystemDate,IsActive) " 
         + " VALUES (@question,@answerbody,@systemdate,@isactive)"
         + " SELECT SCOPE_IDENTITY() AS Id, 'Policy is Added' AS Message";

         var result = await dbContext.execQuery(query, parameters,false);


          
   
            if (result.rowsAffected[0] > 0) {
               return res.json({"message":"Policy Added"});
                  
               
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
   async function putPolicies(req, res) {
      
        var parameters = [];

        parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.policyId });
        parameters.push({ name: 'question', type: TYPES.VarChar, val: req.body.Question});
        parameters.push({ name: 'answerbody', type: TYPES.VarChar, val: req.body.AnswerBody});
        parameters.push({ name: 'isactive', type: TYPES.VarChar, val: req.body.IsActive });
        parameters.push({ name: 'systemdate', type: TYPES.DateTime, val: new Date() });

 
        //REMOVE UNASSIGNED PARAMETERS
        parameters = parameters.filter(function (el) {
            return el.val != null;
          });


        var updateQuery="UPDATE dbo.PoliciesFAQGuidelines SET ";
        var setQuery= "";
        var WhereClause =  " WHERE PolicyID = @Id";
        var query ="";

      for(var i=0; i<parameters.length;i++){

        if(parameters[i].val != null)
        {
            //console.log("INSIDE LOOP");
           // console.log(parameters[i].name);
            switch(parameters[i].name)
            {
                case "question":
                    setQuery +=  "Question= @question" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                    break;
                case "answerbody":
                     setQuery +=  "AnswerBody= @answerbody" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
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
                      return res.json({"message":"Policy Saved."});
                   
                    }
                 
                    return res.sendStatus(500);  //UPDATE FAILED
    }

  async function deletePolicies(req, res) {
        
        var parameters = [];

        if (req.params.policyId) {
            var parameters = [];

            parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.policyId });

            var query = "delete from dbo.PoliciesFAQGuidelines where PolicyID = @Id"

            var result =  await dbContext.execQuery(query, parameters, false);
               
                if (result.rowsAffected[0] > 0) { 
                   return res.json({"message":"Record is deleted"});
                }
                   return res.json({"message":"Delete failed."});
        }
        
    }


    return {
        getAllAdmin: getAllPoliciesAdmin,
        getAll: getAllPolicies,
        get: getPolicies,
        post: postPolicies,
        put: putPolicies,
        intercept: findPolicies,
        delete: deletePolicies
    }
}

module.exports = PolicyRepository;