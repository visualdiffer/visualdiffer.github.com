const readline = require('readline');
const fs = require('fs');

const readInterface = readline.createInterface({
    input: fs.createReadStream('unixshell.md'),
    // output: process.stdout,
    console: false
});

let prevLine = null;


readInterface.on('line', function(line) {
	if (line[0] === '=') {
		if (prevLine) {
			const anchor = prevLine.toLowerCase().replace(/[^a-z0-9]+/g, '_');
			console.log(`[${prevLine}](#${anchor})`);
			prevLine = null;
		}
		console.log(line);
	} else {
		if (prevLine !== null) {
			console.log(prevLine);
		}
		prevLine = line;
	}
});
readInterface.on('close', function(line) {
	if (prevLine) {
		console.log(prevLine);
	}
});