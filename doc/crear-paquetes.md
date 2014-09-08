Generar clave GPG:

    gpg --gen-key
    gpg ---export -a "User Name" > user_name.public.gpg

Enviar clave GPG publica al administrador del repositorio. Para copiar la clave privada a otro equipo:

    gpg --export-secret-key -a "User Name" > user_name.private.gpg
    gpg --allow-secret-key-import --import user_name.private.gpg

Instalar requerimientos:

    apt-get install dh-make devscripts build-essential dbhelper

Para crear paquetes nativos (e.j. solo scripts y configuración):

    dh_make --native --indep

Al construir paquetes, especificar el profile para lintian:

    debuild -uc -us --lintian-opts --profile=tatu

(Averiguar porque no funcionan los exports de .profile)

Crear una nueva version:

    dch -i --vendor tatu
