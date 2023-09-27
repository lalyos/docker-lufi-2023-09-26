#!/bin/bash

cat > /var/www/html/index.html <<EOF
<html lang="en">
<head>
    <title>Document</title>
</head>
<body bgcolor="${COLOR:=gray}">
    <h1>${TITLE:=Welcome}</h1>
    ${BODY:=Please use COLOR/TITLE/BODY env vars}
    <hr>
    Copyralyt 2023.
</body>
</html>
EOF

exec nginx -g "daemon off;"
