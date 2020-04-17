# Running
docker container run --name h2_server --rm -p 5435:5435 -p 8082:8082 -v h2_data:/h2-data -d leonan/h2-server