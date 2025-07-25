## scan-class

Simple script for scanning my classroom VMs on the [Virginia Cyber Range](https://www.virginiacyberrange.org/).  This script assumes using "[Kali Shared Networks](https://www.virginiacyberrange.org/courseware/shared_networks_env_kali_desktop_2024_7)" with student DNS hostnames like:

```
	kali.sierra998.example.com
	kali.delta650.example.com
	kali.whiskey402.example.com
```

The purpose of the scan-class.sh script is to quickly scan your classroom VMs and report on each student's network assignment results. The scan-class.sh usage is:
scan-class.sh -w(reqd) [-n] [-f] host1 host2

Here's a usage example and sample results:
```
$ ./scan-class.sh -wfn kali.sierra998.example.com kali.delta650.example.com kali.whiskey402.example.com


### PRE LOOP STATUS ###
HOSTS=kali.sierra998.example.com kali.delta650.example.com kali.whiskey402.example.com
ports=80


host=kali.sierra998.example.com
## WEB SITE SCAN - kali.sierra998.example.com
   Debian Logo Apache2 Debian Default Page
   It works!
## NMAP PORT SCAN + MYNUM- kali.sierra998.example.com
nmap  -Pn -T4  -p 80,998 --open kali.sierra998.example.com
PORT    STATE SERVICE
80/tcp  open  http
998/tcp open  busboy
MAC Address: 02:17:CD:07:B3:15 (Unknown)



host=kali.delta650.example.com
## WEB SITE SCAN - kali.delta650.example.com
   kali.delta650.example.com
## NMAP PORT SCAN + MYNUM- kali.delta650.example.com
nmap  -Pn -T4  -p 80,650 --open kali.delta650.example.com
PORT   STATE SERVICE
80/tcp open  http
MAC Address: 02:5D:B3:C9:5D:6F (Unknown)



host=kali.whiskey402.example.com
## WEB SITE SCAN - kali.whiskey402.example.com

Looking up kali.whiskey402.example.com
Making HTTP connection to kali.whiskey402.example.com
Alert!: Unable to connect to remote host.

lynx: Can't access startfile http://kali.whiskey402.example.com/
## NMAP PORT SCAN + MYNUM- kali.whiskey402.example.com
nmap  -Pn -T4  -p 80,402 --open kali.whiskey402.example.com
PORT    STATE SERVICE
402/tcp open  genie
MAC Address: 02:23:50:2E:63:87 (Unknown)
```

More info on Cyber Range [Shared-Networks](https://www.virginiacyberrange.org/courseware?q=Shared%20Networks%20Env:%20Kali%20Desktop)

