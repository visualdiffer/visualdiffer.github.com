#!/usr/bin/env bash
# Add Markdown anchors to all Heading elements (only level 1 and level 2)
# The "Heading Alternate Syntax" must have at least 4 = or - characters otherwise the anchor is not added

if [ $# -eq 0 ]
then
	echo Missing file parameter
	exit 1
fi

gawk '
func toAnchor(str) {
	// is already link
	if (str ~ /^\s?\[/) {
		return str;
	}
	anchor = tolower(str);
	gsub(/[^a-z0-9]/, "_", anchor);
	gsub(/_+$/, "", anchor);

	return "[" str "](#" anchor ")";
}

func flush_buffer() {
	# --line_index;
	# line = lines[line_index];
	# delete lines[line_index];
	for (i = 0; i < line_index; i++) {
		print lines[i];
	}
	line_index = 0;
}

func isHeaderAlreadySkipped(line) {
	if (header_read) {
		return 0;
	}
	print line;
	if (line == "---") {
		if (inside_header) {
			header_read=1;
		} else {
			inside_header = 1;
		}
	}
	return 1;
}

BEGIN { 
	header_read = 0;
	inside_header = 0;
	line_index = 0;
} 
END { 
	flush_buffer();
}

/^(##?)/ { 
	if (!inside_header) {
		flush_buffer();
		line=$0;
		gsub(/^#+/, "", line);
		print toAnchor(line);
	}
} 
/^(====+)|(----+)/ { 
	--line_index;
	last = lines[line_index];
	delete lines[line_index];
	flush_buffer();
	print toAnchor(last);
} 
{
	if (!isHeaderAlreadySkipped($0)) {
		lines[line_index++] = $0;
	}
}' \
$1 >$1.bak
mv $1.bak $1
