const Laboratorio = require('../models/laboratorio');

module.exports = function (app) {

  app.get('/laboratorio',(req,res)=>{
    Laboratorio.getLaboratorio((err,data)=>{
      res.status(200).json(data);

    });
  });
}
