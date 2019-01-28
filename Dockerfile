FROM ubuntu:18.04

# Requirements
RUN apt-get update
RUN apt-get install -y git ssh tar gzip ca-certificates sudo
RUN apt-get install -y cmake clang mysql-client
RUN apt-get install -y libboost-dev libboost-filesystem-dev libboost-iostreams-dev libboost-program-options-dev libboost-regex-dev libboost-system-dev libboost-thread-dev libssl-dev libmysqlclient-dev libreadline-dev libncurses-dev zlib1g-dev libbz2-dev
RUN apt-get autoremove -y
RUN apt-get autoclean -y
RUN rm -rf /var/lib/apt/lists/*

#Setup
RUN git config --global user.email "circleci@build.bot" && git config --global user.name "Circle CI"
RUN sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100
RUN sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 100
