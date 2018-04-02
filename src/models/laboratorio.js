const mysql = require('mysql');
connection = mysql.createConnection({
host: 'localhost',
user: 'root',
password:'',
database: 'sedipro_palomapp'
});

let laboratorioModel ={}
laboratorioModel.getLaboratorio=(callback)=>{
  if (connection) {
    connection.query('SELECT * FROM v_laboratorio ',
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


module.exports = laboratorioModel;
