var Browser = require("zombie");
var url = process.argv[2];

// Load the page from localhost
browser = new Browser()
browser.visit(url, function () {
    console.log("Loaded!")
});