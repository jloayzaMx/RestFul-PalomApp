const ObjetosPerdidos = require('../models/objetosperdidos');

module.exports = function (app) {

  app.get('/objetosperdidos',(req,res)=>{
    ObjetosPerdidos.getObjetosPerdidos((err,data)=>{
      res.status(200).json(data);

    });
  });
}
