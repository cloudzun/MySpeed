[![贡献者][contributors-shield]][contributors-url]
[![分支][forks-shield]][forks-url]
[![星标][stars-shield]][stars-url]
[![问题][issues-shield]][issues-url]
[![MIT 许可证][license-shield]][license-url]
[![发布版本][release-shield]][release-url]

<br />
<div align="center">
  <a href="https://github.com/cloudzun/myspeed">
    <img src="https://i.imgur.com/aCmA6rH.png" alt="Logo" width="80" height="80">
  </a>
  <h3>MySpeed <a href="README.de.md">🇩🇪</a> <a href="README.en.md">🇺🇸</a> <a href="README.md">🇨🇳</a></h3>
</div>

## 🤔 什么是 MySpeed？

MySpeed 是一款网络速度测试分析软件，可以记录您的网络速度长达 30 天。

### ⭐ 功能特性

- 📊 MySpeed 生成关于速度、延迟等方面的清晰统计数据
- ⏰ MySpeed 自动化速度测试，允许您使用 Cron 表达式设置测试间隔时间
- 🗄️ 直接向 MySpeed 实例添加多个服务器
- 🩺 配置健康检查，在出现错误或停机时通过邮件、Signal、WhatsApp 或 Telegram 通知您
- 📆 测试结果可以存储长达 30 天
- 🔥 支持 Prometheus 和 Grafana
- 🗳️ 可选择 Ookla、LibreSpeed 和 Cloudflare 速度测试服务器
- 💁 在我们的[网站](https://myspeed.dev)了解更多关于 MySpeed 的信息

### ⬇️ 安装方式

#### 🐧 Linux 安装

##### 方式一：使用 Docker（推荐）

1. **克隆仓库**：
   ```bash
   git clone https://github.com/cloudzun/MySpeed.git
   cd MySpeed
   ```

2. **使用 Docker Compose 启动**：
   ```bash
   # 创建数据目录
   mkdir -p data
   
   # 启动服务
   docker-compose up -d
   ```

3. **或使用提供的脚本**：
   ```bash
   # 使用便捷脚本启动
   ./run.sh
   
   # 停止服务
   ./stop.sh
   ```

##### 方式二：手动 Docker 部署

```bash
# 构建镜像
docker build -t myspeed:local .

# 运行容器
docker run -d \
  --name myspeed \
  --restart unless-stopped \
  -p 5216:5216 \
  -v $(pwd)/data:/myspeed/data \
  -e TZ=Asia/Shanghai \
  myspeed:local
```

##### 方式三：使用官方镜像

```bash
# 使用官方预构建镜像
docker run -d \
  --name myspeed \
  --restart unless-stopped \
  -p 5216:5216 \
  -v myspeed_data:/myspeed/data \
  germannewsmaker/myspeed
```

#### 🪟 Windows 安装

- **参考 [Windows 安装指南](https://docs.myspeed.dev/setup/windows)**

### 🚀 快速开始

1. 访问 Web 界面：http://localhost:5216
2. 首次访问时进行初始配置
3. 选择速度测试提供商（Ookla、LibreSpeed 或 Cloudflare）
4. 配置测试间隔和服务器
5. 开始自动化网络速度监控

### 📋 管理命令

```bash
# 查看容器状态
docker ps | grep myspeed

# 查看日志
docker logs myspeed

# 重启服务
docker restart myspeed

# 使用 Docker Compose 管理
docker-compose logs       # 查看日志
docker-compose restart    # 重启服务
docker-compose down       # 停止服务
docker-compose up -d      # 启动服务
```

### 🔧 配置说明

- **端口**：默认运行在 5216 端口
- **数据存储**：所有数据存储在 `/myspeed/data` 目录
- **时区**：可通过环境变量 `TZ` 设置时区
- **环境变量**：
  - `NODE_ENV=production`：生产环境模式
  - `TZ=Asia/Shanghai`：设置时区

### 📸 界面截图

#### 首页（列表视图）

<img src="https://i.imgur.com/NHX7Ba9.png" alt="首页">

#### 首页（统计视图）
<img src="https://i.imgur.com/5JAFgrk.png" alt="统计">

#### 服务器选择

<img src="https://i.imgur.com/hgOR93G.png" alt="服务器选择">

#### 下拉菜单

<img src="https://i.imgur.com/alKEMrg.png" alt="下拉菜单">

#### 速度测试进行中页面

<img src="https://i.imgur.com/kxsrjIe.png" alt="速度测试进行中页面">

### 🛠️ 开发

#### 本地开发环境

```bash
# 安装依赖
npm install
cd client && npm install

# 启动开发服务器
npm run dev  # 同时启动前端和后端

# 或分别启动
npm run server  # 启动后端
npm run client  # 启动前端
```

#### 构建

```bash
# 构建前端
npm run build
```

### 🔗 相关链接

- **官方网站**：https://myspeed.dev
- **文档**：https://docs.myspeed.dev
- **Docker Hub**：https://hub.docker.com/r/germannewsmaker/myspeed

### 🤝 贡献

欢迎贡献代码！请先阅读贡献指南。

### 📄 许可证

本项目采用 MIT 许可证分发。查看 `LICENSE` 文件了解更多信息。

### 🆕 更新日志

#### 2025-10-26
- 添加中文 README 文档
- 优化 Docker 部署配置
- 添加便捷的启动和停止脚本
- 改进 Docker Compose 配置兼容性

---

## 心动了吗？

太好了，让我们开始吧！您可以根据上面的安装说明来部署 MySpeed。

[contributors-shield]: https://img.shields.io/github/contributors/cloudzun/myspeed.svg?style=for-the-badge
[contributors-url]: https://github.com/cloudzun/myspeed/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/cloudzun/myspeed.svg?style=for-the-badge
[forks-url]: https://github.com/cloudzun/myspeed/network/members
[stars-shield]: https://img.shields.io/github/stars/cloudzun/myspeed.svg?style=for-the-badge
[stars-url]: https://github.com/cloudzun/myspeed/stargazers
[issues-shield]: https://img.shields.io/github/issues/cloudzun/myspeed.svg?style=for-the-badge
[issues-url]: https://github.com/cloudzun/myspeed/issues
[license-shield]: https://img.shields.io/github/license/cloudzun/myspeed.svg?style=for-the-badge
[license-url]: https://github.com/cloudzun/myspeed/blob/master/LICENSE
[release-shield]: https://img.shields.io/github/v/release/cloudzun/myspeed.svg?style=for-the-badge
[release-url]: https://github.com/cloudzun/myspeed/releases/latest