var response = require('../../shared/response');
var TYPES = require('mssql').TYPES;

function JobsRepository(dbContext) {

    async function findJobs(req, res, next) {


        
        if (req.params.jobsId) { //ALWAYS REPLACE THIS WITH CORRECT PARAM
            var parameters = [];

            parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.jobsId });

            var query = "SELECT * FROM dbo.vw_AllJobs where JobID = @Id"

            var result = await dbContext.execQuery(query, parameters, false);

        

            if(result.rowsAffected[0] > 0)
                 {
                  
                    req.data = result.recordset[0];
                    return next();
                }
              return res.json({"message":"No item found. Item not existing"});
            
        }

    }

    function getJobs(req, res) {
        return res.json(req.data);
    }

   async function getAllJobs(req, res) {

        var query = "SELECT * FROM dbo.vw_AllActiveJobs";

        var result = await dbContext.execQuery(query, null, false);
       
        
       if(result.rowsAffected[0] > 0)
           {
              req.data = result.recordset;
              return res.json(req.data);
           }
            
          return res.sendStatus(404);
          
    }

    async function getAllJobsAdmin(req, res) {

        var query = "SELECT JobID, JobHeadline, JobSalaryLow, JobSalaryHigh,  JobDescText, JobDatePosting, JobImg, IsActive FROM dbo.JobOpenings";

        var result = await dbContext.execQuery(query, null, false);
       
        
       if(result.rowsAffected[0] > 0)
           {
              req.data = result.recordset;
              return res.json(req.data);
           }
            
          return res.sendStatus(404);
          
    }




   
   async function postJobs(req, res) {
        var parameters = [];

        parameters.push({ name: 'jobheadline', type: TYPES.VarChar, val: req.body.JobHeadline});
        parameters.push({ name: 'jobsalarylow', type: TYPES.VarChar, val: req.body.JobSalaryLow});
        parameters.push({ name: 'jobsalaryhigh', type: TYPES.VarChar, val: req.body.JobSalaryHigh});
        parameters.push({ name: 'jobDescText', type: TYPES.NVarChar, val: req.body.JobDescText});
        parameters.push({ name: 'jobDatePosting', type: TYPES.VarChar, val: req.body.JobDatePosting});
        parameters.push({ name: 'jobImg', type: TYPES.VarChar, val: req.body.JobImg});
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

         var query = "INSERT INTO dbo.JobOpenings (JobHeadline, JobSalaryLow, JobSalaryHigh,JobDescText, JobDatePosting, JobImg, IsActive, SystemDate) " 
         + " VALUES (@jobheadline,@jobsalarylow, @jobsalaryhigh,@jobDescText,@jobDatePosting,@jobImg,@isactive,@systemdate)"
         + " SELECT SCOPE_IDENTITY() AS Id, 'Job is Added' AS Message";

         var result = await dbContext.execQuery(query, parameters,false);


          
   
            if (result.rowsAffected[0] > 0) {
               return res.json({"message":"Job Posting Added"});
                  
               
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
   async function putJobs(req, res) {
      
        var parameters = [];

        parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.jobsId });
        parameters.push({ name: 'jobheadline', type: TYPES.VarChar, val: req.body.JobHeadline});
        parameters.push({ name: 'jobsalarylow', type: TYPES.VarChar, val: req.body.JobSalaryLow});
        parameters.push({ name: 'jobsalaryhigh', type: TYPES.VarChar, val: req.body.JobSalaryHigh});
        parameters.push({ name: 'jobDescText', type: TYPES.NVarChar, val: req.body.JobDescText});
        parameters.push({ name: 'jobDatePosting', type: TYPES.VarChar, val: req.body.JobDatePosting});
        parameters.push({ name: 'jobImg', type: TYPES.VarChar, val: req.body.JobImg});
        parameters.push({ name: 'isactive', type: TYPES.VarChar, val: req.body.IsActive });
        parameters.push({ name: 'systemdate', type: TYPES.DateTime, val: new Date() });


 
        //REMOVE UNASSIGNED PARAMETERS
        parameters = parameters.filter(function (el) {
            return el.val != null;
          });


        var updateQuery="UPDATE dbo.JobOpenings SET ";
        var setQuery= "";
        var WhereClause =  " WHERE JobID = @Id";
        var query ="";

      for(var i=0; i<parameters.length;i++){

        if(parameters[i].val != null)
        {
            //console.log("INSIDE LOOP");
           // console.log(parameters[i].name);
            switch(parameters[i].name)
            {
                case "jobheadline":
                    setQuery +=  "JobHeadline= @jobheadline" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                    break;
                case "jobsalarylow":
                     setQuery +=  "JobSalaryLow= @jobsalarylow" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                     break;
                case "jobsalaryhigh":
                     setQuery +=  "JobSalaryHigh= @jobsalaryhigh" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                     break;
                case "jobDescText":
                     setQuery +=  "JobDescText= @jobDescText" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                     break;
                case "jobDatePosting":
                    setQuery +=  "JobDatePosting= @jobDatePosting" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                    break;
                case "jobImg":
                    setQuery +=  "JobImg= @jobImg" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
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
                      return res.json({"message":"Job Saved."});
                   
                    }
                 
                    return res.sendStatus(500);  //UPDATE FAILED
    }

  async function deleteJobs(req, res) {
        
        var parameters = [];

        if (req.params.jobsId) {
            var parameters = [];

            parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.jobsId });

            var query = "delete from dbo.JobOpenings where JobID = @Id"

            var result =  await dbContext.execQuery(query, parameters, false);
               
                if (result.rowsAffected[0] > 0) { 
                   return res.json({"message":"Record is deleted"});
                }
                   return res.json({"message":"Delete failed."});
        }
        
    }


    return {
        getAllAdmin: getAllJobsAdmin,
        getAll: getAllJobs,
        get: getJobs,
        post: postJobs,
        put: putJobs,
        intercept: findJobs,
        delete: deleteJobs
    }
}

module.exports = JobsRepository;