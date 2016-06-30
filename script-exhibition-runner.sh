#!/usr/bin/env node

// Modules
// =======

var child_process = require( 'child_process' );
var os = require( 'os' );
var fs = require( 'fs' );

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
    getFilenameForNumber( 'videos', number, function ( filename ) {
        console.log( 'Will play video', filename );
        logProcess( 'omx', child_process.spawn( 'omxplayer', [ '-b', '--loop', '--no-osd', __dirname + '/videos/' + filename ] ) );
    });
}

// Startup Webapp
// --------------

function startWebApp ( number ) {

    // Start the webserver serving
    logProcess( 'server', child_process.spawn( 'python', [ '-m', 'SimpleHTTPServer', '3000' ], { cwd: __dirname } ) );

    // Start the browser
    getFilenameForNumber( 'html', number, function ( filename ) {
        console.log( 'Attempting to play:', filename );
        logProcess( 'browser', child_process.spawn( __dirname + '/lib/script-run-browser.sh', [ 'http://0.0.0.0:3000/html/' + filename ] ) );
    });
}

// Utils
// =====

function logProcess( name, process ) {
    process.stdout.on( 'data', function ( data ) {
         console.log( name, '(stdout)', data.toString() );
    });
    process.stdin.on( 'data', function ( data ) {
        console.log( name, '(stderr)', data.toString() );
    });
}

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

    child_process.exec( __dirname + '/lib/print-dip', onPideeValue );

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

function getFilenameForNumber ( path, number, callback ) {

    console.log( 'Looking for', path, number );

    var process = child_process.spawn( __dirname + '/lib/script-get-files.sh', [ path, number ], { cwd: __dirname } );

    var files = '';

    process.stdout.on( 'data', function ( data ) {
         files += data.toString();
    });

    process.on( 'close', function () {
        console.log( 'process finished with:', files );
        callback( files.replace(/\n$/, '') );
    });

}


