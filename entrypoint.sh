#! /bin/bash

# 启动ssh守护进程
/etc/init.d/ssh start

# 保持前台有进程运行 防止容器自动退出
top
