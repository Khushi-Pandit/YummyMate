const router = require("express").Router();
const UserController = require("../controller/user.controller.js");

router.post('/registration',UserController.register);


module.exports = router;