const UserService = require('../services/user.service.js');

exports.register = async(req,resp,next)=>{
    try{
        const {email, name} = req.body;

        const successRes = await UserService.registerUser(email, name);

        resp.json({status : true, success : "User Registered successfully"});

    }catch(error){
        throw error;
    }
}