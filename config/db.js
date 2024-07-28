const mongoose = require("mongoose");
const connection = mongoose.createConnection('mongodb://localhost:27017/YummyMate').on('open',()=>{
console.log("Database connected");
}).on('error',()=>{
console.log('Database Connection Error');
});

module.exports = connection;