UbuntuにOracle 11gをインストールする。

1.ubuntu64ビット版 を vagrant up
2.swap追加

provision.sh

3.oracle-xeパッケージのリポジトリを追加

3.1.apt-utilsをインストール



3.最新化

vagrant@precise64:~$ sudo apt-get update
#vagrant@precise64:~$ sudo apt-get install alien libaio1 unixodbc bc chkconfig sysv-rc-conf
vagrant@precise64:~$ sudo apt-get install libaio1 unixodbc bc

4.alienコマンド

vagrant@precise64:/vagrant_data/oracle11g-xe$ fakeroot alien --to-deb --scripts oracle-xe-11.2.0-1.0.x86_64.rpm


Appendix.1

  config.vm.provision :shell, inline:<<-EOS
    echo "set grub-pc/install_devices /dev/sda" | debconf-communicate
    apt-get update
    apt-get -y upgrade
  EOS
