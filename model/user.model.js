const mongoose = require("mongoose");
const db = require("../config/db.js");

const { Schema } = mongoose;

const userSchema = new Schema({
    email : {
        type : String,
        required: true,
    },
    name : {
        type : String,
        required: true,
    },
});

const UserModel = db.model("user",userSchema);

module.exports = UserModel;