docker run -d -v "$PWD/data":/data -p 5080:5080 orlandohohmeier/local-npm:latest


docker run -d -p 7083:27017 -v ./data/db:/data/db -v ./data/configdb:/data/configdb --name kleinanzeigen-mongo mongo:latest

# external url
mongodb://agofm.ddnss.de:7083
