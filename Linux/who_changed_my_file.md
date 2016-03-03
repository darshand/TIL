# Who changed my file in my Linux machine? (auditd)

> It usually happens when something goes wrong in production server by mistakenly some file got changed by someone in an organisation and no one wants to take responsibility of "WHO CHANGED THAT FILE". 

> Unfortunaletly Linux doesn't give file level history in its metadata, of who changed what at which time.!!!!

> Same thing happened with me also today. So started digging about is there any solution to this ? and found '**auditd**' tool.

## auditd
> auditd or audit daemon is a powerful tool or framework which is used to obtain information about events happening on a Linux system. It is responsible for writing audit records to the disk.
 
### installing auditd
> `sudo apt-get install auditd` will install auditd tool in your system.
> This package will install bellow audit tools.
>* **auditctl**: tool to control the beahaviour of the daemon on the fly, adding rules, etc.
>* **/etc/audit/audit.rules**: file to declare audit rules.
>* **aureport**: tool to generate and view audit report.
>* **ausearch**: tool to search various events.
>* **autrace**: used to trace a process.
>* **/etc/audit/auditd.conf**: configuration file of audit tool.

### check `auditd` status
> After installing `auditd` check the status `sudo service auditd status` if status is `not running` start the service either `sudo service auditd start` or `/etc/init.d/auditd start` which start the `auditd` serviece.

### check rules
> Initially no rules will be there. Check the rules by running `sudo auditctl -l`, which will return if there are any rules otherwise no rules. 

### Setting `watch/rule` to audit
> Adding rules will specify which file or folder should be monitored for events happenned on them. Use the command `sudo auditctl -w /etc/passwd -p warx -k password` or simply `sudo auditctl -w /etc/passwd -p warx` to set a watch on file `/etc/passwd`.

> Use `sudo auditctl -l` to see, if the `rule` is set or not.

> Once the rule is set, it starts watching that file for events happenned on that file/folder.

### How to delete a rule 
> If you setuped rule with `-k` option use `sudo auditctl -D -k <your_key>`. Otherwise use `sudo auditctl -W <file/folder_path>`. Note `-w` is to setup the rule , `-W` is to delete the rule.

### How to see reports
> To get the audit reports or changes on the file. Use `sudo ausearch -i -k <my_key>` if you setuped rules with `-k`. Otherwise use `sudo ausearch -f <file/folder_path>` 

> The reult you will get is little cumbersome. Below are the important parts from the output.
>* **name**: name of the file you are monitoring. 
>* **cwd**: current working directory.
>* **syscall**: related system call.
>* **uid**: userid of the user who access the file.
>* **gid**: groupid of the user who access the file.
>* **comm**: the command user is used to access the file.
>* **exe**: location of the command executed.

> All the data is bit level. You have to rematch the `syscall`,`uid` and `gid` to get to know who is the user and what is the system call used. 

> There is a workaround to display user and group in the audit log itself. 
> Add `session required pam_loginuid.so` to `/etc/pam.d/common-session` file.

### Audit report
> Use `sudo aureport` to get a summary report of the audit systelm log.

> Use `sudo aureport -au ` to get detailed report of the audit system log.

### Auditd configuration file.
> The above done watches are temporary. To make them parmanent add the same rules to `/etc/audit/audit.rule` file and restart `auditd`. 



## NOTE
>* Auditd can only monitors arbitrary files or direcories. We cannot place watch on `root` directory. And we cannot use `wildcards`.
>* Audit tool's log files are stored in `/var/log/audit/audit.log.*`. Please make sure to delete logs regularly , these consuemes much high memory.


#### References 
>* [The Linux Audit System, or Who Changed That File?] (http://www.la-samhna.de/library/audit.html)   
>* [
Auditd - Tool for Security Auditing on Linux Server] (http://linoxide.com/how-tos/auditd-tool-security-auditing/)
