#!/bin/bash

# MySpeed Docker 运行脚本

echo "🚀 正在启动 MySpeed..."

# 检查 Docker 是否安装
if ! command -v docker &> /dev/null; then
    echo "❌ Docker 未安装，请先安装 Docker"
    exit 1
fi

# 创建数据目录
mkdir -p ./data

# 使用 Docker Compose 启动（如果存在）
if [ -f "docker-compose.yml" ]; then
    echo "📝 使用 Docker Compose 启动..."
    # 检查 docker-compose 命令
    if command -v docker-compose &> /dev/null; then
        docker-compose up -d
    else
        docker compose up -d
    fi
else
    # 构建镜像
    echo "🔨 构建 Docker 镜像..."
    docker build -t myspeed:local .
    
    # 停止并删除已存在的容器
    echo "🛑 停止已存在的容器..."
    docker stop myspeed 2>/dev/null || true
    docker rm myspeed 2>/dev/null || true
    
    # 启动新容器
    echo "▶️ 启动新容器..."
    docker run -d \
        --name myspeed \
        --restart unless-stopped \
        -p 5216:5216 \
        -v "$(pwd)/data:/myspeed/data" \
        -e TZ=Asia/Shanghai \
        myspeed:local
fi

# 等待服务启动
echo "⏳ 等待服务启动..."
sleep 5

# 检查容器状态
if docker ps | grep -q myspeed; then
    echo "✅ MySpeed 已成功启动！"
    echo "🌐 访问地址: http://localhost:5216"
    echo "📊 可以开始进行网络速度测试了"
    echo ""
    echo "📋 常用命令:"
    echo "  查看日志: docker logs myspeed"
    echo "  停止服务: docker stop myspeed"
    echo "  重启服务: docker restart myspeed"
else
    echo "❌ 启动失败，请查看日志: docker logs myspeed"
    exit 1
fi