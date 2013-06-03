var page = require('webpage').create();
page.open('some.html', function () {
    page.render('example.png');
    phantom.exit();
});