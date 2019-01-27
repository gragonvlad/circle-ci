FROM ubuntu:18.04

# Requirements
RUN apt-get update
RUN apt-get install -y git ssh tar gzip ca-certificates
RUN apt-get install -y cmake clang mysql-server-5.7
RUN apt-get install -y libboost-dev libboost-filesystem-dev libboost-iostreams-dev libboost-program-options-dev libboost-regex-dev libboost-system-dev libboost-thread-dev libssl-dev libmysqlclient-dev libreadline-dev libncurses-dev zlib1g-dev libbz2-dev

#Setup
RUN git config user.email "circleci@build.bot" && git config user.name "Circle CI"
RUN sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100
RUN sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 100
RUN mysql -uroot -e 'create database test_mysql;'
RUN mkdir bin