#!/bin/sh

if ! /etc/init.d/apache2 status > /dev/null;
 then /etc/init.d/apache2 start;
fi
