const express = require('express');
const app = express();
const morgan = require('morgan');
const bodyParser = require('body-parser');


//setting
app.set('port' , process.env.PORT || 3000);

//middlewares
app.use(morgan('dev'));
app.use(bodyParser.json());
app.use(function(req, res, next) {
    res.header('Access-Control-Allow-Origin', "*");
    res.header('Access-Control-Allow-Methods','GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
});
//routes
require('./routes/administradorRoutes')(app);
require('./routes/cafeteriaRoutes')(app);
require('./routes/laboratorioRoutes')(app);
require('./routes/localRoutes')(app);
require('./routes/objetosPerdidosRoutes')(app);
require('./routes/v_menuRoutes')(app);

app.listen(app.get('port'),()=>{
  console.log('server on port 3000');
});
