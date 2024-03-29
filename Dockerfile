FROM rust

WORKDIR /app

# 使用中科院镜像替换debian来进行apt安装
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN sed -i 's|security.debian.org/debian-security|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list

RUN apt-get update && apt-get install apt-utils -y && apt-get install lld clang -y

COPY ./.cargo/config.toml /usr/local/cargo

RUN rustup self update && rustup component add clippy && rustup component add rustfmt
RUN cargo install cargo-tarpaulin 
RUN cargo install cargo-audit
# RUN cargo install cargo-watch 

ENTRYPOINT [ "cargo" ]
