#!/bin/bash

# Get folder name from command line argument
folder_name=$1

# Create a new directory for the project
mkdir $folder_name
cd $folder_name || exit

npm init -y

npm i bcrypt connect-mongo cookie-parser dotenv ejs express express-ejs-layouts express-session jsonwebtoken method-override mongoose

npm i nodemon --save-dev

touch .env

echo "node_modules/
.env" >> .gitignore

echo '

****************************************************************
now you should add start and dev in scripts in package.json file
****************************************************************

'

echo '
require("dotenv").config();

const express = require("express");
const expressLayout = require("express-ejs-layouts");
const methodOverride = require("method-override");
const cookieParser = require("cookie-parser");
const session = require("express-session");
const MongoStore = require("connect-mongo");

const connectDB = require("./server/config/db");
const { isActiveRoute } = require("./server/helpers/routeHelpers");

const app = express();
const PORT = process.env.PORT || 5000;
  
// Connect to DB
connectDB();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(cookieParser());
app.use(methodOverride("_method"));

app.use(session({
  secret: "keyboard cat",
  resave: false,
  saveUninitialized: true,
  store: MongoStore.create({
    mongoUrl: process.env.MONGODB_URI
  }),
  //cookie: { maxAge: new Date ( Date.now() + (3600000) ) } 
}));

app.use(express.static("public"));

// Templating Engine
app.use(expressLayout);
app.set("layout", "./layouts/main");
app.set("view engine", "ejs");


app.locals.isActiveRoute = isActiveRoute; 


app.use("/", require("./server/routes/main"));
app.use("/", require("./server/routes/admin"));

app.listen(PORT, ()=> {
  console.log(`App listening on port ${PORT}`);
});
' > index.js
 
 mkdir public
 cd public
 mkdir css
 touch css/style.css
 mkdir images
 mkdir js
 touch js/script.js 
 cd ..
 
 mkdir server
 cd server
 mkdir routes
 mkdir config
 mkdir models
 mkdir helpers
 
echo '
const express = require("express");
const router = express.Router();

/**
 * GET /
 * HOME
*/
router.get("", async (req, res) => {
  try {
    const locals = {
      title: "",
      description: ""
    }


    res.send("hello");

  } catch (error) {
    console.log(error);
  }

});


module.exports = router;
' > routes/main.js 
 
echo '
const mongoose = require("mongoose");
const connectDB = async () => {
  
  try {
    mongoose.set("strictQuery", false);
    const conn = await mongoose.connect(process.env.MONGODB_URI);
    console.log(`Database Connected: ${conn.connection.host}`);
  } catch (error) {
    console.log(error);
  }

}

module.exports = connectDB;
' > config/db.js 

 cd ..
 
 mkdir views
 cd views
 mkdir partials
 mkdir layouts
 echo '
 <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><%= locals.title %></title>
  <meta name="description" content="<%= locals.description %>">
  <link rel="stylesheet" href="/css/style.css">
  <script type="text/javascript" defer src="/js/script.js"></script>
</head>
<body>
  
  <%- include("../partials/search.ejs")  %>
  <div class="container">
    <%- include("../partials/header.ejs")  %>
    <main class="main">
      <%- body %>
    </main>
    <%- include("../partials/footer.ejs")  %>
  </div>  

</body>
</html>
' > layouts/main.ejs
 
 echo '
 <div class="author">
  <h1 class="author__heading">Hi, I am Shamim.</h1>
  <p class="author__body">Web developer and content creator.</p>
</div>
' > index.ejs
 
 cd ..
 
 git init 
 git add .
 git commit -m "starting of the ejs project"
 
echo "

project starter pack unveiled successfully..."

