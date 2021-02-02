var response = require('../../shared/response');
var TYPES = require('mssql').TYPES;

function NewsRepository(dbContext) {

    async function findNews(req, res, next) {


        
        if (req.params.newsId) { //ALWAYS REPLACE THIS WITH CORRECT PARAM
            var parameters = [];

            parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.newsId });

            var query = "SELECT * FROM dbo.vw_AllNews where NewsId = @Id"

            var result = await dbContext.execQuery(query, parameters, false);

        

            if(result.rowsAffected[0] > 0)
                 {
                  
                    req.data = result.recordset[0];
                    return next();
                }
                return res.json('No item found. Item not existing');
            
        }

    }

    function getNews(req, res) {
        return res.json(req.data);
    }

   async function getAllNews(req, res) {

        var query = "SELECT * FROM dbo.vw_AllActiveNews";

        var result = await dbContext.execQuery(query, null, false);
       
        
       if(result.rowsAffected[0] > 0)
           {
              req.data = result.recordset;
              return res.json(req.data);
           }
            
          return res.sendStatus(404);
          
    }




   
   async function postNews(req, res) {
        var parameters = [];

        parameters.push({ name: 'headline', type: TYPES.VarChar, val: req.body.headline});
        parameters.push({ name: 'newsbody', type: TYPES.NVarChar, val: req.body.newsbody});
        parameters.push({ name: 'newsPreview', type: TYPES.VarChar, val: req.body.newsPreview});
        parameters.push({ name: 'newsdate', type: TYPES.VarChar, val: req.body.newsdate});
        parameters.push({ name: 'headlineImg', type: TYPES.VarChar, val: req.body.headlineImg});
        parameters.push({ name: 'isactive', type: TYPES.Bit, val: req.body.isactive });
        parameters.push({ name: 'systemdate', type: TYPES.DateTime, val: new Date() });

        for(var i=0; i<parameters.length;i++){

            if(parameters[i].val == null)
            {
                console.log(parameters[i].name +'is missing. Insert failed.');
                return res.json( 'Insert failed, parameters missing.');
  
            }

        }

        //CONTINUE  WITH INSERT

         var query = "INSERT INTO dbo.News (Headline,NewsPreviewText,NewsBodyText,NewsDate,HeadlineImg,SystemDate,IsActive) " 
         + " VALUES (@headline,@newsPreview,@newsbody,@newsdate,@headlineImg,@systemdate,@isactive)"
         + " SELECT SCOPE_IDENTITY() AS Id, 'News is Added' AS Message";

         var result = await dbContext.execQuery(query, parameters,false);


          
   
            if (result.rowsAffected[0] > 0) {
                  
                return res.json(result.recordset);
            }
           
            return res.json( 'Insert failed. Might be API issue check logs.');
      
    }

    function addComma(index, paramslength)
    {

      var toAddComma = (index == (paramslength-1) || paramslength == 1) ? false: true; 
        
      if(toAddComma)
        return ", ";
     else
        return "";

    }
   async function putNews(req, res) {
      
        var parameters = [];

        parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.newsId });
        parameters.push({ name: 'headline', type: TYPES.VarChar, val: req.body.headline});
        parameters.push({ name: 'newsbody', type: TYPES.NVarChar, val: req.body.newsbody});
        parameters.push({ name: 'newsPreview', type: TYPES.VarChar, val: req.body.newsPreview});
        parameters.push({ name: 'newsdate', type: TYPES.VarChar, val: req.body.newsdate});
        parameters.push({ name: 'headlineImg', type: TYPES.VarChar, val: req.body.headlineImg});
        parameters.push({ name: 'isactive', type: TYPES.Bit, val: req.body.isactive });
        parameters.push({ name: 'systemdate', type: TYPES.DateTime, val: new Date() });

 
        //REMOVE UNASSIGNED PARAMETERS
        parameters = parameters.filter(function (el) {
            return el.val != null;
          });


        var updateQuery="UPDATE dbo.News SET ";
        var setQuery= "";
        var WhereClause =  " WHERE NewsID = @Id";
        var query ="";

      for(var i=0; i<parameters.length;i++){

        if(parameters[i].val != null)
        {
            //console.log("INSIDE LOOP");
           // console.log(parameters[i].name);
            switch(parameters[i].name)
            {
                case "headline":
                    setQuery +=  "Headline= @headline" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                    break;
                case "newsbody":
                     setQuery +=  "NewsBodyText= @newsbody" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                     break;
                case "newsPreview":
                     setQuery +=  "NewsPreviewText= @newsPreview" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                     break;
                case "newsdate":
                    setQuery +=  "NewsDate= @newsdate" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
                    break;
                case "headlineImg":
                    setQuery +=  "HeadlineImg= @headlineImg" + addComma(i,parameters.reduce((r, o) =>  r + +!Object.values(o).includes(undefined), 0))
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

                var result = await dbContext.execQuery(query, parameters,false);
             
                if (result.rowsAffected[0] > 0) {
                        return res.json('News Article Saved.');
                    }
                   
                    return res.sendStatus(422);
    }

  async function deleteNews(req, res) {
        
        var parameters = [];

        if (req.params.newsId) {
            var parameters = [];

            parameters.push({ name: 'Id', type: TYPES.Int, val: req.params.newsId });

            var query = "delete from dbo.News where NewsId = @Id"

            var result =  await dbContext.execQuery(query, parameters, false);
               
                if (result.rowsAffected[0] > 0) { 
                    return res.json('Record is deleted');
                }
                return res.json('Delete failed.');
        }
        
    }


    return {
        getAll: getAllNews,
        get: getNews,
        post: postNews,
        put: putNews,
        intercept: findNews,
        delete: deleteNews
    }
}

module.exports = NewsRepository;