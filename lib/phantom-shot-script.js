var page = require('webpage').create(),
    system = require('system'),
    address;

address = system.args[1];

page.open(address, function () {
    
    var result = {};
    var file_format = 'PNG';
//    page.render(encodeURIComponent(address) + '.png');

    result.image_data = page.renderBase64(file_format);    

    console.log( JSON.stringify(result) );

    phantom.exit();
});

