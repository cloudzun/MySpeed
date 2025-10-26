# MySpeed 项目部署记录

## 项目概述

MySpeed 是一个网络速度测试分析软件，可以监控和记录网络速度长达 30 天。

## 今日操作记录 (2025-10-26)

### 1. 项目部署
- 使用 Docker 成功构建和部署了 MySpeed 项目
- 创建了本地镜像 `myspeed:local`
- 容器运行在端口 5216，数据持久化到 `./data` 目录

### 2. 配置文件创建
- **docker-compose.yml**: Docker Compose 配置文件，兼容旧版本 docker-compose
- **run.sh**: 便捷启动脚本，自动检测 docker-compose 版本
- **stop.sh**: 便捷停止脚本，优雅关闭服务
- **README.zh.md**: 完整的中文文档，包含详细的安装和使用说明

### 3. 功能验证
- ✅ 容器成功启动并运行
- ✅ Web 界面正常访问 (http://localhost:5216)
- ✅ 数据库连接正常
- ✅ 所有集成模块正常加载

### 4. GitHub 同步
- 配置远程仓库: https://github.com/cloudzun/MySpeed.git
- 创建并推送 development 分支
- 创建并推送 main 分支
- 提交了所有新增的配置文件和文档

## 技术栈

- **前端**: React + Vite
- **后端**: Node.js + Express
- **数据库**: SQLite (默认)
- **容器化**: Docker + Docker Compose
- **速度测试**: Ookla, LibreSpeed, Cloudflare

## 快速启动

```bash
# 克隆仓库
git clone https://github.com/cloudzun/MySpeed.git
cd MySpeed

# 启动服务
./run.sh

# 访问界面
open http://localhost:5216
```

## 管理命令

```bash
# 启动服务
./run.sh

# 停止服务
./stop.sh

# 查看日志
docker logs myspeed

# 重启服务
docker-compose restart
```

## 目录结构

```
MySpeed/
├── client/          # 前端代码
├── server/          # 后端代码
├── data/            # 数据目录 (运行时创建)
├── scripts/         # 安装脚本
├── docs/            # 文档
├── docker-compose.yml    # Docker Compose 配置
├── Dockerfile       # Docker 构建文件
├── run.sh          # 启动脚本
├── stop.sh         # 停止脚本
├── README.md       # 英文文档
├── README.zh.md    # 中文文档
└── package.json    # 项目配置
```

## 注意事项

1. 确保端口 5216 未被占用
2. 数据目录需要有写入权限
3. 首次启动会自动创建 SQLite 数据库
4. 建议定期备份 `./data` 目录

## 下一步计划

- [ ] 配置 HTTPS 访问
- [ ] 设置定时备份
- [ ] 集成 Prometheus 监控
- [ ] 配置邮件通知
- [ ] 优化性能监控

---
更新时间: 2025-10-26
维护者: cloudzun