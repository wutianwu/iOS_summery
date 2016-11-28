Git是分布式的代码管理工具，远程的代码管理是基于SSH的，所以要使用远程的Git则需要SSH的配置。
——————————先做
1. 设置Git的user name和email：
```ssh
$ git config --global user.name "your name"
$ git config --global user.email "your email"

```
2. 生成SSH密钥过程：
> 1. 查看是否已经有了ssh密钥：cd ~/.ssh 
> 如果没有密钥则不会有此文件夹，有则备份删除
> 2. 生存秘钥：
> $ ssh-keygen -t rsa -C “your email” 按3个回车，密码为空。
```ssh
Your identification has been saved in /home/tekkub/.ssh/id_rsa.
Your public key has been saved in /home/tekkub/.ssh/id_rsa.pub.
The key fingerprint is:
………………
```
> 3. 最后得到了两个文件：id_rsa和id_rsa.pub
> 
3. 通过cat 命令打印id-rsa.pub 文件，并复制，发送给 git服务器管理员