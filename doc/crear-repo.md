Generar clave GPG:

    gpg --gen-key
    gpg --armor --export tatu@plan.ceibal.edu.uy --output tatu.gpg.key > tatu.gpg.key

Crear estructura de directorios:

    mkdir -p /srv/reprepro/ubuntu/{conf,dists,incoming,indices,logs,pool,project,tmpl}
    # chown /srv/reprepro to appropiate user (ie. nginx user, or user with persmissions to publish packages)
    cd /srv/reprepro/ubuntu

Editar `conf/distributions`, configurar el ID de la clave GPG.
Editar `conf/options`

Agregar paquetes al repositorio:

    reprepro --basedir /srv/reprepro/ubuntu/ include tatu /home/saguiar/dev/hello/tatu_0.1_amd64.changes

Donde `.changes` es creada via `debuild`.

Instalar pbuilder, usado para construir paquetes para multiples plataformas/distribuciones.

    sudo apt-get install pbuilder debootstrap 

Crear `~/.pbuilderrc`, como en el archivo de ejemplo.

Crear entornos para `pbuilder`:

    sudo pbuilder create
    sudo ARCH=amd64 pbuilder create

Actualizar `pbuilder`; se debe hacer diariamente antes de construir nuevos paquetes:

    sudo pbuilder update

Construir un paquete desde el directorio que contiene el código fuente y el directorio debian/:

    pdebuild # for default ARCH, which in .pbuilderrc is i386
    ARCH=amd4 pdebuild # for amd64 build.

Quitar un paquete:

    reprepro --basedir /srv/reprepro/ubuntu/ remove tatu tatu

Agregar el paquete:

    reprepro --basedir /srv/reprepro/ubuntu/ include tatu /var/cache/pbuilder/precise-i386/result/tatu_0.1_i386.changes

Agregar el paquete en 64 bits:

    reprepro --basedir /srv/reprepro/ubuntu/ include tatu /var/cache/pbuilder/precise-amd64/result/tatu_0.1_amd64.changes

Importar claves de desarrolladores de paquetes:

     gpg --import key.public.gpg
