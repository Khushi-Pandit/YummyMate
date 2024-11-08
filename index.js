const app = require("./app.js");
const PORT = 3000;

app.get("/", (req, resp) => {
  resp.send("Hello Mimi!");
});

app.listen(PORT, () => {
  console.log("Server Started");
});
