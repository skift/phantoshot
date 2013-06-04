var page = require('webpage').create();
var system = require('system');

var result = {
   url: system.args[1],
   width: parseInt(system.args[2]),
   height: parseInt(system.args[3])
};


page.viewportSize = {
  width: result.width,
  height: result.height
};

page.open(result.url, function() {
    
    result.file_format = 'PNG';
    result.image_data = page.renderBase64(result.file_format);    

    console.log( JSON.stringify(result) );

    phantom.exit();
});