# Introduction to ssh - **S**ecure**Sh**ell

## What is ssh?
> ssh(secure shell) is a safe and secure protocal, used to connet remote linux machines from a local machine.
> ssh creates a text based interface (shell session) when successfully logged in by providing necessary credentials. Throughout the sessions, whatever user types in the local shell session will executes in remote machine. 

> There exists a password based login also to login in to remote machine, but because of password login is prone to bruteforce attack login throgh ssh-key method is preferred.

 ## Actors in ssh protocal
> Followings are the 2 major actors of ssh protocal.

 ### sshd (ssh daemon) 
> sshd is a small chunk of code running in remote server side.
 *. listens for a specific network port mentioned.
 *. authenticates requests from different machines.
 *. on successful authentication spawns appropriate environments.

### ssh client
>ssh client is a small piece of code running in client side.
 *. Knows how to communicate with remote using ssh protocal.
 *. Know which hosts to connect.
 *. Knows credentials to be passed to authenticate ssh session.




