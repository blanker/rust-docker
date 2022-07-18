# rust-docker
在docker环境下开发rust应用，而不需要在本地安装rust/cargo/gcc等环境

## 使用说明

### 通过docker-compose命令创建rust项目
```bash
docker-compose run --rm cargo init
```

### 运行rust项目
```bash
docker-compose run --rm cargo run
```

## 一些说明
### 中科院镜像
1. Dockerfile
在dockerfile文件中使用中科院镜像替换原debian安装源
2. ./.cargo/config.toml
配置了crateio源的镜像为中科院镜像

### 一些编译优化
1. 配置在./.cargo/config.toml中
