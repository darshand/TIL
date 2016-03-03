# Who changed my file in my Linux machine? (auditd)

> It usuall happens when something goes wrong in production server by mistakenly some file got changed by someone in an organisation and no one wants to take responsibility of "WHO CHANGED THAT FILE". 

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
> Initially no rules will be there. Check the rules by running `sudo auditctl -l`, which will return if there are any rules otherwise *no rules***
