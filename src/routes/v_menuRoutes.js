const v_menu = require('../models/v_menu');

module.exports = function (app) {

  app.get('/v_menu',(req,res)=>{
    v_menu.getV_menu((err,data)=>{
      res.status(200).json(data);

    });
  });
}
