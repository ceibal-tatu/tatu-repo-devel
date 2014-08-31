Instalar requerimientos:

    apt-get install dh-make devscripts build-essential dbhelper

Para crear paquetes nativos (e.j. solo scripts y configuración):

    dh_make --native --indep

Al construir paquetes, especificar el profile para lintian:

    debuild -uc -us --lintian-opts --profile=tatu

(Averiguar porque no funcionan los exports de .profile)

Crear una nueva version:

    dch -i --vendor tatu
