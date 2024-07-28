const UserModel = require("../model/user.model.js")

class UserService {
    static async registerUser(email, name){
        try{
            const createUser = new UserModel({email, name});  // by this whatever data will come from the user will get stored into database.
            return await createUser.save();
        }catch(err){
            throw err;
        }
    }
}

module.exports = UserService;