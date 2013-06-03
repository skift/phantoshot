var page = require('webpage').create(),
    system = require('system'),
    address;

address = system.args[1];
console.log(address)
page.open(address, function () {
    page.render(encodeURIComponent(address) + '.png');
    phantom.exit();
});