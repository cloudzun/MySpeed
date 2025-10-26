#!/bin/bash

# MySpeed Docker 停止脚本

echo "🛑 正在停止 MySpeed..."

# 检查是否使用 Docker Compose
if [ -f "docker-compose.yml" ]; then
    echo "📝 使用 Docker Compose 停止..."
    # 检查 docker-compose 命令
    if command -v docker-compose &> /dev/null; then
        docker-compose down
    else
        docker compose down
    fi
else
    # 直接停止容器
    echo "🔨 停止 Docker 容器..."
    docker stop myspeed
    docker rm myspeed
fi

echo "✅ MySpeed 已停止"