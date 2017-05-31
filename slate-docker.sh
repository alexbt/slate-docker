#!/bin/bash
docker run --rm -p 4567:4567 -v $(pwd):/app/slate/source/test -it slate-docker
