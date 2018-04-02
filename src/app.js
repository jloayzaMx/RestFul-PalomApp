const express = require('express');
const app = express();
const morgan = require('morgan');
const bodyParser = require('body-parser');


//setting
app.set('port' , process.env.PORT || 3000);

//middlewares
app.use(morgan('dev'));
app.use(bodyParser.json());

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
