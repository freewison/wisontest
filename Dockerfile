# 从一个空镜像中开始创建，没有任何依赖。
FROM scratch
MAINTAINER DaoCloud <example@daocloud.io>

# 给 Docker 文件系统中添加根目录，也是 Linux 的一些基础目录。
ADD ./rootfs.tar /

# 给镜像添加工作目录 /app
RUN mkdir -p /app

# 设定默认工作路径
WORKDIR /app

# 复制应用进入到镜像中
COPY ./static /app

# 复制应用依赖的静态文件目录
COPY ./public /public

# 对外开放的服务接口为 8080
EXPOSE 8080

# 容器运行时默认调用的启动命令
CMD ["/app/static"]
