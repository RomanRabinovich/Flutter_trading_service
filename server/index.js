// imports from pakages
const express = require('express');
const mongoose = require('mongoose');

// imports from other files
const authRouter = require('./routes/auth');

// init
const PORT = 3000;
const app = express();
const DB = 'mongodb+srv://roman:cShGHAMmnJcT2v8s@cluster0.bpmkiq9.mongodb.net/?retryWrites=true&w=majority';

// middleware
app.use(express.json());
app.use(authRouter);

// connections
mongoose.connect(DB).then(() => {
console.log('connection successful');
}).catch((e) => {
console.log(e);
});

app.listen(PORT, '0.0.0.0', () => {
console.log(`connected at port ${PORT}`);
});