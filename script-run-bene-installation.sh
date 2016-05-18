#!/usr/bin/env node

var child_process = require( 'child_process' );

console.log("Hello World");

child_process.exec( './libpidee/examples/bin/print-dip', onPideeValue );

function onPideeValue ( error, stdout, stderror ) {

	var pideeDipValue = parseInt( stdout, 10 );

	console.log( 'value is', pideeDipValue );

}