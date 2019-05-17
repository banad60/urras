# urras - ubuntu-remote-root-access-setup

[urras](https://en.wikipedia.org/wiki/Planets_of_the_Hainish_Cycle#Urras)
is designed to work on a freshly installed ubuntu system (server) from
a workstation (client) from the system administrator getting root-access to set
up the server as well with a base of tools and a color-supported 
working-evniroment ready to work.


## Quick Start

For the application to work, some requirements are necessary:

### At the server

- a freshly installed ubuntun  (>= 18.04)
- a user with sudo privilege, who is also on the client exists.

### At the client
  - a user with the same name as the privileged user of the server.
    This user starts the application.
  - an existent public RSA key in `$HOME/.ssh/id_rsa.pub` of this user is required
  - the user is active with his public key at his localen ssh-agent logged in


## Application:

- the user changes to the client in the console in the directory of the application:
```
cd DIRECTORY
```
- in the user edit 'setup / basic_config.ini' according to your requirements:
```
export DESTHOST = XXX.XXX.XXX.XXX
export DESTHOSTNAME = 'TESTHOSTHAME'
export DESTHOSTUSER = 'testuser'
```
- the user starts the application with the call:
```
./urras_remote-setup.sh
```
- the user enters twice the password for the priveleged user of the server:
```
password
```


After successful execution, the administrator can use login on the server 
without a password, assumed he is active logged in at the local ssh-agent
with his private-key.

```
ssh -A root@XXX.XXX.XXX.XXX
```

If the administrator is not logged in to the ssh-agent, then he have to 
use the password of the privileged user from the server.
