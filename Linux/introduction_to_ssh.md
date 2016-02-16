# Introduction to ssh - **S**ecure**Sh**ell

## What is ssh?
> Ssh(secure shell) is a safe and secure protocal, used to connet remote linux machines.
> Ssh creates a text based interface (shell session) when successfully logged in by providing necessary credentials. Throughout the sessions, whatever user types in the local shell session will executes in remote machine. 

## Actors in ssh protocal
> Followings are the 2 major actors of ssh protocal.

#### sshd (ssh daemon) 
> sshd is a small chunk of code running in remote server side.
>* listens for a specific network port mentioned.
>* authenticates requests from different machines.
>* on successful authentication spawns appropriate environments.

#### ssh client
>ssh client is a small piece of code running in client side.
>* Knows how to communicate with remote using ssh protocal.
>* Know which hosts to connect.
>* Knows credentials to be passed to authenticate ssh session.

## How authentication works?
>1. Password based authentication.
>2. Shh-key based authentication.

#### Password based authentication
> Users can login to remote machines by providing already created user credentials (username , password ). Very easy to setup this type of authentication. The main drawback of this method is, it is prone to 'bruteforce' attack.
> Attackekrs having remote host address can try multiple tries using automated bots.

#### Ssh-key based authentication
> This is the more secure and widely used authentication method while connecting to remote host. 

> Client machine generates a pair of keys(public key, private key) before authentication begins using a well know and secure encryption algorithm(RSA,DSA,..).
> Generate ssh key using `ssh-keygen -t rsa` (I used rsa algo). Which generates a pair of public and private keys in a hidden folder under user's home directory `.ssh/`. Which contain 2 files `id_rsa` (private key) and `id_rsa.pub` (public key). 

> **Public key** can be distributed without worrying about securuty isuues. 
> **Private key** should be maintained with security. 

> Client's public key is stored in remote machines `.ssh/authorized_keys` file.

> ##### Authentication works as below #####
>+ Client generates a pair of public and private keys, stores them in specified file (`id_rsa, id_rsa.pub`).
>+ By manually or through other steps client's public key is copied to remote host's `.ssh/autorized_keys` file.
>+ Client initiates login process by providing user name in remote machine along with remote host addres `ssh username@remote_host_address`.
>+ Remote machine searches for public key in user's `.ssh/authorized_key` file.
>+ Remote mchine generates a random string/number and encrypts it with public key. (Encrypted message can only be decrypted by associated private key)
>+ Send encrypted message to client.
>+ Client decrypts encrypted message using private key.
>+ Generates an MD5 hash with the decrypted message and an session id.
>+ Sends the hash value to remote machine.
>+ Host machine matches the hash with original string with the session id. If it matches with Original string that was encrypted, establishes a connection between client and host.
   
## Usefull info
>- Default key length of ssh is 2048, for more security you can generate a key with more length like `ssh-keygen -b 4096`
>- If client machine's username is same as remote machine's username, client can login without providing username while making ssh connection,like `ssh [-p] remote_host_address`
>- Client can run a single command withohut login to remote host, like `ssh username@remote_host_address yout_command`
>- Client can configure connection related tweeks by createing a `config` file in `.ssh` folder. Example, for keeping alive the session for more time.
>- To return from freezed session use `~.`.
>- Client can move sessions to backgrounds and foregrounds. `~ + [ctrl+z]` to move the current session to backgroound. `jobs` is the command to list sessions running in background. Client can move session to foreground using `fg` command. This moves the recent job to foreground. If there are multiple jobs use `fg %[number]`. This brings the specified session to foreground.
  
    



