const app = require("./app.js");
const db = require("./config/db.js");
const UserModel = require("./model/user.model.js");
const PORT = 5000;

app.get('/',(req, resp)=>{
resp.send("Hello Mimi!")
});

app.listen(PORT,()=>{
console.log('Server Started');
});