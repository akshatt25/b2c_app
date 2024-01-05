//packages
const express = require("express");
const mongoose = require('mongoose');
//import from othe files
const authRouter = require("./routes/auth");
//init
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://akshatt25g:Akshat2523@cluster0.g7c6333.mongodb.net/?retryWrites=true&w=majority"
//middleware
app.use(express.json());
app.use(authRouter);

//connections
mongoose.connect(DB).then(()=>{
    console.log('Connection Successful');
}).catch((e)=>{
    console.log(e);
});

app.listen(PORT,"0.0.0.0", function (){
console.log(`Connected to port ${PORT} `);
});