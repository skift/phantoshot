var page = require('webpage').create(),
    system = require('system'),
    address;

address = system.args[1];
width = parseInt(system.args[2]);
height = parseInt(system.args[3]);

// the width and height are not being set correctly
// I think they are being passed in fine, just not getting into the viewport below
// If I hard code the values into the viewport, the test passes...

page.viewportSize = {
  width: width,
  height: height
};

page.open(address, function () {
    
    var result = {};
    var file_format = 'PNG';
//    page.render(encodeURIComponent(address) + '.png');

    result.image_data = page.renderBase64(file_format);    

    console.log( JSON.stringify(result) );

    phantom.exit();
});