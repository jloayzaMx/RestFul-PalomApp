const Local = require('../models/local');

module.exports = function (app) {

  app.get('/local',(req,res)=>{
    Local.getLocal((err,data)=>{
      res.status(200).json(data);

    });
  });
}
