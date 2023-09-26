#!/bin/bash

cat > /var/www/html/index.html <<EOF
<html lang="en">
<head>
    <title>Document</title>
</head>
<body>
    <h1>${TITLE:=Welcome}</h1>
</body>
</html>
EOF

nginx -g "daemon off;"
