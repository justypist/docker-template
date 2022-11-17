# 安装lts版本node可执行文件
# 通过apt安装太慢 并且目前没有找到国内镜像 暂时通过直接下载二进制包的方式安装
#curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo bash -
#apt-get install -y nodejs

# 通过镜像地址下载并解压nodejs二进制
wget https://mirrors.ustc.edu.cn/node/v16.9.1/node-v16.9.1-linux-x64.tar.gz
tar -xvf node-v16.9.1-linux-x64.tar.gz
rm node-v16.9.1-linux-x64.tar.gz
mkdir -p $HOME/.local
mv node-v16.9.1-linux-x64 $HOME/.local/nodejs
echo -e "\
# nodejs
export PATH=\$PATH:\$HOME/.local/nodejs/bin
" >> $HOME/.bashrc
source $HOME/.bashrc

# NPM镜像
npm config --location=global set registry https://npmreg.proxy.ustclug.org/

# 更新npm & 安装pnpm
npm install --location=global npm pnpm
# pnpm 初始化
pnpm setup