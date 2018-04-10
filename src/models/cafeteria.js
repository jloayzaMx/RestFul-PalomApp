const Pool = require('pg-pool');
const pool = new Pool({
host: 'ec2-54-243-213-188.compute-1.amazonaws.com',
port: '5432',
user: 'yqghebejkgtyuk',
password:'e4ec888ff29da9d31eeb4111990c441462a95d4087f8cb6230151767a51712b2',
database: 'dfip05gaio33q9',
ssl: true
});

let cafeteriaModel ={}
cafeteriaModel.getCafeteria=(callback)=>{
  if (pool) {
    pool.query('select * from ....',
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


module.exports = cafeteriaModel;
