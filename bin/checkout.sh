ADDRESS="sse ssl tcp http udp httpx ws httpxdraft wsdraft httpxe wse pipe wsn wsr wsx rtmp wsxdraft"

TRANSPORT="bio http nio pipe sse ssl ws wseb wsn wsr"

SERVICE="amqp broadcast echo http.balancer http.directory proxy"

MODULES=""

# Add all resource address modules
for i in $ADDRESS
do
	MODULES="$MODULES gateway.resource.address.$i"
done

# Add all transport modules
for i in $TRANSPORT
do
	MODULES="$MODULES gateway.transport.$i"
done

# Add all service modules
for i in $SERVICE
do
	MODULES="$MODULES gateway.service.$i"
done

MODULES="gateway.resource.address gateway.transport gateway.service \
	gateway.security gateway.util gateway.management gateway.server \
	mina.core mina.netty common test.util gateway.server.spi \
	gateway.server.api gateway.distribution \
	gateway.console gateway.bridge gateway.service.update.check \
    gateway.service.update.check.management $MODULES"

echo $i

for i in $MODULES
do
	echo "=== Cloning $i ==="
    git clone -b develop https://github.com/jitsni/$i.git
    git submodule add https://github.com/jitsni/$i.git
done
