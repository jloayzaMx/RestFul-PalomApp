const mysql = require('mysql');
connection = mysql.createConnection({
host: 'localhost',
user: 'root',
password:'',
database: 'sedipro_palomapp'
});

let AdministradorModel ={}
AdministradorModel.getAdministrador=(callback)=>{
  if (connection) {
    connection.query('select * from administrador order by id_administrador',
    (err,rows)=>{
      if (err) {
        throw err;


      }else {
        callback(null,rows);
      }
    }
  )
  }
};
AdministradorModel.insertAdministrador=(administradorData,callback)=>{
if (connection) {
  connection.query(
    'insert into administrador set ?',administradorData,
(err,results)=>{
  if (err) {
    throw err;
  }else {
    callback(null,{
      'insertId': results.insertId
    })
  }
}
)

}
};

module.exports = AdministradorModel;
