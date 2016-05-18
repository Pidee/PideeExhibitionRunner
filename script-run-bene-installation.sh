#!/usr/bin/env node

// Modules
// =======

var child_process = require( 'child_process' );
var os = require( 'os' );

// Config
// ======
var IS_VIDEO_MASK = 128;


// Startup
// =======

getPideeValue( function ( value ) {
    
    if ( getMaskIsSet( value, IS_VIDEO_MASK ) ) {

        startVideoPlayer( value - IS_VIDEO_MASK );
        
    } else {

        startWebApp( value );
        
    }
    
});

// Runners
// =======

// Startup Video
// -------------

function startVideoPlayer ( number ) {
    
}

// Startup Webapp
// --------------

function startWebApp ( number ) {

    // Start the webserver serving
    var serverProcess = child_process.spawn( 'python', [ '-m', 'SimpleHTTPServer', '3000' ] );

    // Start the webbrowser
    var webBrowserProcess = child_process.spawn( 'epiphany-browser', [ 'http://localhost:3000/html/' + number + '.html' ] );

    // Press the fullscreen key
    setTimeout( function () {
         child_process.spawn( 'xte', [ '"key F11"', '-x:0' ] );
    }, 25000 );
    
    
}

// Utils
// =====

// Get Pidee Value
// ---------------

function getPideeValue ( callback ) {

    var platform = os.platform();

    if ( platform == 'darwin' ) {
        var value = 17;
        console.log( 'On OSX, faking value with', value );
        setImmediate( function () {
            callback( value );
        });
        return;
    }

    child_process.exec( './print-dip', onPideeValue );

    function onPideeValue ( error, stdout, stderror ) {
        console.log( 'Print-dip:', stdout );
        
            var value = parseInt( stdout, 10 );
            console.log( 'Pidee value:', value );
            callback( value );
    }
    
}

function getMaskIsSet ( value, mask ) {
    return (value & mask) !== 0;
}


// console.log("Hello World");

// child_process.exec( './libpidee/examples/bin/print-dip', onPideeValue );

// function onPideeValue ( error, stdout, stderror ) {

// 	var pideeDipValue = parseInt( stdout, 10 );

// 	console.log( 'value is', pideeDipValue );

// }
