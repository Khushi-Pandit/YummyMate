const express = require("express");
const body_parser = require("body-parser");
const userRouter = require("./routes/user.router.js");
const mongoose = require("mongoose");

const app = express();
app.use(body_parser.json());
app.use('/',userRouter);

mongoose.connect("mongodb://localhost:27017/YummyMate", {
    useNewUrlParser: true,
    useUnifiedTopology: true,
}).then(() => {
    console.log("Database connected");
}).catch((err) => {
    console.log("Database connection error", err);
});

module.exports = app;

