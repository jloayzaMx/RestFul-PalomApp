const Administrador = require('../models/administrador');

module.exports = function (app) {

  app.get('/administrador',(req,res)=>{
    Administrador.getAdministrador((err,data)=>{
      res.status(200).json(data);

    });
  });
  app.post('/administrador',(req,res)=>{
    //console.log(req.body);
const administradorData = {
  id_administrador:null,
  nombres:req.body.nombres,
  apellidos:req.body.apellidos,
  email:req.body.email,
  telefono:req.body.telefono,
  usuario:req.body.usuario,
  contrasena:req.body.contrasena
};
Administrador.insertAdministrador(administradorData,(err,data)=>{
if (data && data.insertId) {
  //console.log(data);
  res.json({
    success:true,
    msg:'administrador insertado',
    data: data
  })
}else {
  res.status(500).json({
    success: false,
    msg: 'error'
  })
}

})
});
}
