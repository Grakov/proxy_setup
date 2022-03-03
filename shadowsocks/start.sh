#!/bin/bash
docker build -t ss_service_image .
docker run -d -p 80:80 -p 443:443 --name ss_service_container --restart=always ss_service_image