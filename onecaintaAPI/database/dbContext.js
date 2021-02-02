//var Request = require('tedious').Request;
const sql = require('mssql');
var config = require('./connection');
var utility = require('./utility/utility');


 async function executeSQL(qry, params, isMultiSet ) {
    var dataset;
   var runCTR = 0;


   try{

      await sql.connect(config).then(pool => {
            // Query
            console.log('Executing Query...');
            let request =  pool.request();

            if(params != null)
           {
              params.forEach(param => {
                   request.input(param.name, param.type, param.val);
               });
           }

           result =  request.query(qry);
              
           return result
    }).then( result => {
      

            dataset = result;       
           
    });

    console.log('Returning Results...');
    console.log(dataset);
        return dataset;
 }
 catch(error){
        console.log('Failed to connect/retrieve data');
        console.error("Retrying");
        runCTR++;
        // I suggest using some variable to avoid the infinite loop.
        if(runCTR<3)
        {
          // executeSQL(qry, params, isMultiSet );
        }   
}



   



}




module.exports = {
    get: executeSQL,
    post: executeSQL,
    execQuery: executeSQL
};