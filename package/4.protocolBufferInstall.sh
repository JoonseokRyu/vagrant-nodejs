#!/bin/sh
echo -e "\n- Protobuf Install Start\n"

protoc=/usr/local/bin/protoc

pb_ver=`$protoc --version`
INSTALL_VER="2.5.0"

if [ "${pb_ver}" == "libprotoc "$INSTALL_VER ]; then
	echo "alreay Protobuf v"$INSTALL_VER
else
	if [ -f /vagrant/tgz/protobuf-$INSTALL_VER.tar.gz ]; then
		echo "copy file......"
		cp /vagrant/tgz/protobuf-$INSTALL_VER.tar.gz .
	else
		echo "download......"
		wget https://protobuf.googlecode.com/files/protobuf-$INSTALL_VER.tar.gz
	fi

	tar xfzp protobuf-$INSTALL_VER.tar.gz
	cd protobuf-$INSTALL_VER

	echo "configure......"
	./configure &> ../protoc_configure.log
	echo "make......"
	make &> ../protoc_make.log
	echo "make install......"
	make install &> ../protoc_makeinstall.log
	cd ..
	rm -rf protobuf-$INSTALL_VER*
fi

echo -e "\n- Protobuf Install End\n"
