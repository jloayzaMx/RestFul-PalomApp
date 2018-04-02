const Cafeteria = require('../models/cafeteria');

module.exports = function (app) {

  app.get('/cafeteria',(req,res)=>{
    Cafeteria.getCafeteria((err,data)=>{
      res.status(200).json(data);

    });
  });
}
