1) Utilizar una maquina con Ubuntu 14.04

2) Descargar la ultima version de tatu-repo-devel, contiene todos los script de configuracion y armado de paquetes para tatu.

    Ej: wget http://taturepo.ddns.net/ubuntu/pool/main/t/tatu-repo-devel/tatu-repo-devel_0.37_all.deb

3) Instalarlo: sudo  dpkg -i tatu-repo-devel_0.37_all.deb


4) Crear entornos de building.

    sudo pbuilder create --configfile /etc/pbuilderrc.i386.tatu
    sudo pbuilder create --configfile /etc/pbuilderrc.amd64.tatu

5) Generar un par de claves GPG, para firmar los paquetes.

gpg --gen-key


6) Enviar el id de la calve GPG al administrador del repo tatu.

gpg --list-secret-keys

/home/gustavo/.gnupg/secring.gpg
--------------------------------
sec   2048R/A9E6A222 2014-11-26
uid                  Gustavo Duarte <gus.duarte@gmail.com>
ssb   2048R/19CFFAD2 2014-11-26

Publicar la key publica a un server gpg
gpg --keyserver pgp.mit.edu --send-key A9E6A222


Enviar el id: A9E6A222 al administrador del repo TATU.

7) Configuar git con el mismo numbre de usuario y email, de las calves GPG

git config --global user.name "Gustavo Duarte"
git config --global user.email "gus.duarte@gmail.com"


8) Clonar un repo para hacer la primera prueba de todo el flujo. tatu-hello

git clone git@github.com:ceibal-tatu/tatu-hello.git

9) Hacer algun cambio en tatu-hello.c.in

10) Buildear y probar localmente o en una maquina de test.

Parado en el directorio tatu-hello

sudo pbuilder create --configfile /etc/pbuilderrc.i386.tatu

11) El paquete generado queda en: /var/cache/pbuilder/precise-i386/result/

12) Instalarlo y probarlo.
dpkg -i tatu-hello_0.14_i386.deb

13) Generar un release.

Parado en el directorio tatu-hello

tatu-release -i 

14) Publicarlo

tatu-publish -n tatu-hello -v 0.14

En el ultimo paso se preguntara por la passphrase para firma la publicacion. 
