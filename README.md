# urras - ubuntu-remote-root-access-setup

[urras] is designed to work on a freshly installed ubuntu system (server) from a workstation (client) from the system administrator getting root-access to set up the server as well with a base of tools and a color-supported working-evniroment ready to work.

## Quick Start

For the application to work, some requirements are necessary:
1. at the server)
- a freshly installed ubuntun  (>= 18.04)
- a user with sudo privilege, who is also on the client exists.

2. at the client)
- a user with the same name as the privileged user of the server. this user starts the application.
- in $ HOME / .ssh this user must be the public-key with the ubuntu-fixed filename 'id_rsa.pub'
- the user is active with his public key at his localen ssh-agent logged in

## Application:

- the user changes to the client in the console in the directory of the application:

    $ cd <DIRECTORY>

- in the user edit 'setup / basic_config.ini' according to your requirements:

    $ export DESTHOST = XXX.XXX.XXX.XXX
    $ export DESTHOSTNAME = 'TESTHOSTHAME'
    $ export DESTHOSTUSER = 'testuser'


- the user starts the application with the call:
    $ ./urras_remote-setup.sh


- the user enters twice the password for the privelegierten user of the server:

    $ password (ssh, sudo)


After successful execution, the administrator can use login on the server without a password, assumed he is active logged in at the local ssh-agent with his private-key.

    $ ssh -A root@XXX.XXX.XXX.XXX


If the administrator is not logged in to the ssh-agent, then he have to use the password of the privileged user from the server.


## - DE-de --

[urras] is dazu gedacht, dem System-Administrator auf einem frisch installierten ubuntu-System (Server) von einer Arbeitsstation (Client) aus root-access auf dem Server einzurichten sowie dort eine Grundbasis an Tools in einer farb-unterstützten Consolen-Arbreitsubgebung bereit zu stellen. 

## Schneller Start

Damit die Anwendung funktioniert, sind einige Vorraussetzungen notwendig:
1. auf dem Server)
- Ein frish installietes ubuntun (>18.04)
- Ein User mit 'sudo' privileg, der ebenfalls auch auf dem Client existiert.

2. auf dem Client)
- Ein User mit gleichen Namen wie dem privilegierten User des Servers. Dieser User startet die Anwendung.
- In $HOME/.ssh dieses Users muss sich der Public-key mit dem ubuntu-fixen dateiname 'id_rsa.pub' befinden
- Der User ist aktiv mit seinem Private-key an seinem localen ssh-agent angemeldet

## Anwendung:

- Der User wechselt auf dem Client in der Console in das Verzeichnis der Anwendung:

    $ cd <VERZEICHNIS>

- Der User editiert die 'setup/basic_config.ini' nach seinen Anforderungen:

    $ export DESTHOST=XXX.XXX.XXX.XXX
    $ export DESTHOSTNAME='TESTHOSTHAME'
    $ export DESTHOSTUSER='testuser'


- Der User startet die Anwendung mit dem Aufruf:

    $ ./urras_remote-setup.sh


- Der User gibt zwei mal das Passwort für den privelegierten User des Servers ein:

    $ password 


Nach der erfolgreichen Ausführung kann sich der Administrator über ssh am Server ohne Passwort einloggen, vorausgesetzt er ist mit seinem Private-Key aktiv am localen ssh-agent angemeldet.

    $ ssh -A root@XXX.XXX.XXX.XXX


Wenn der Administrator nicht am ssh-agent angemeldet ist, dann muss er das Passwort des privelegierten Users am Server benutzen.
