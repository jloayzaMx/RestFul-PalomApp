const mysql = require('mysql');
connection = mysql.createConnection({
host: 'localhost',
user: 'root',
password:'',
database: 'sedipro_palomapp'
});

let v_menuModel ={}
v_menuModel.getV_menu=(callback)=>{
  if (connection) {
    connection.query('select * from vista_polla',
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


module.exports = v_menuModel;
