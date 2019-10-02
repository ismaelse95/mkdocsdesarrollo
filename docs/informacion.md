# Información sobre Instalación y configuración del servidor Debian

## INTRODUCCIÓN

Buenas, en mi instituto I.E.S Cervantes nos han propuesto hacer un proyecto. El proyecto se trata de montar un servidor, para ello tendremos disponible el dominio “cervantes.org”. Tendremos que empezar por la instalación y configuración del servidor.

## INSTALACIÓN DEL SERVIDOR

Vamos a empezar con la instalación del servidor para ello necesitaremos una imagen de debian montado en un CD y tendremos que seguir los siguientes pasos para instalar el sistema:

1. Comenzamos la instalación y en el menú escogeremos la opción de install.
2. Configuración del idioma. Escogeremos nuestro país y región.
3. La siguiente configuración es el nombre de la máquina y nombre del dominio:
4. Nombre de la maquina: quijote
5. Nombre del dominio: cervantes.org
6. Configuración del nombre y contraseñas: Primero nos pedirá la contraseña del root, después tendremos que introducir el nombre de la maquina y su contraseña.
7. Configuración del particionado del disco: Esta opción la podremos hacer de distintas formas, para que haga el particionado guiado o para particionarlos nosotros mismos escogemos la opción que queramos en mi caso escogeré la opción de particionamiento  guiado.
8. Configuración del gestor de paquetes: En este paso escogemos el gestor de paquetes de españa con la dirección ftp.es.debian.org.
Por último instalamos el grub.

## CONFIGURACIÓN DE RED

En este apartado vamos a explicar la configuración que vamos a tener en nuestro servidor.

## CONFIGURACIÓN DE NOMBRES

Para ver si en la instalación hemos introducido bien el nombre de nuestro servidor lo podremos ver desde la terminal con el comando:

~~~
hostname -f
~~~
~~~
quijote.cervantes.org
~~~

Y para ver la dirección local de la máquina entraremos al fichero de configuración a través del fichero:

~~~
/etc/hosts
~~~

~~~
127.0.1.1 quijote.cervantes.org quijote
~~~

Para modificar el nombre podremos entrar como root en:

~~~
/etc/hostname
~~~

## CONFIGURACIÓN DE LA INTERFACES DE RED

Nuestro servidor tendrá dos tarjetas de red una de ellas la eth0 que sera la que se conecte a Internet dinamicamente y la otra tarjeta de red que sera la eth1, esta tarjeta la utilizaremos para nuestra red privada y tendremos que configurar las dos tarjetas.

Para dejar configurada las dos tarjeta de red tendremos que entrar como root en:

~~~
/etc/network/interfaces
~~~

Una vez dentro tendremos que dejar el fichero de la siguiente manera:

~~~
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
address 192.168.1.254
netmask 255.255.255.0
network 192.168.1.0
broadcast 192.168.1.255
~~~

Salimos del fichero guardando y tendremos que reiniciar las tarjetas de red con el comando systemctl restart networking. Una vez reiniciada ejecutaremos el comando como root:

~~~
ifconfig
~~~

Comprobamos que esta todo correcto.

~~~
eth0 Link encap:Ethernet HWaddr 08:00:27:d8:96:ed 
     inet addr:172.22.0.166 Bcast:172.22.255.255 Mask:255.255.0.0
     inet6 addr: fe80::a00:27ff:fed8:96ed/64 Scope:Link
     UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
     RX packets:650 errors:0 dropped:0 overruns:0 frame:0
     TX packets:133 errors:0 dropped:0 overruns:0 carrier:0
     collisions:0 txqueuelen:1000 
     RX bytes:63761 (62.2 KiB) TX bytes:16941 (16.5 KiB)

eth1 Link encap:Ethernet HWaddr 08:00:27:1d:1a:f6 
     inet addr:192.168.1.254 Bcast:192.168.0.255 Mask:255.255.255.0
     inet6 addr: fe80::a00:27ff:fe1d:1af6/64 Scope:Link
     UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
     RX packets:0 errors:0 dropped:0 overruns:0 frame:0
     TX packets:65 errors:0 dropped:0 overruns:0 carrier:0
     collisions:0 txqueuelen:1000 
     RX bytes:0 (0.0 B) TX bytes:8932 (8.7 KiB)

lo Link encap:Local Loopback 
   inet addr:127.0.0.1 Mask:255.0.0.0
   inet6 addr: ::1/128 Scope:Host
   UP LOOPBACK RUNNING MTU:65536 Metric:1
   RX packets:25 errors:0 dropped:0 overruns:0 frame:0
   TX packets:25 errors:0 dropped:0 overruns:0 carrier:0
   collisions:0 txqueuelen:0 
   RX bytes:2939 (2.8 KiB) TX bytes:2939 (2.8 KiB)
~~~