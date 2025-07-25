## scan-class

Simple script for scanning my classroom VMs on the cyber range.  Assumes using "shared networks" with DNS hostnames like

```
	kali.sierra998.example.com
	kali.delta650.example.com
	kali.whiskey402.example.com
```

Usage: scan-class.sh -w(reqd) [-n] [-f] host1 host2 :
```
$ nmap kali.sierra998.example.com kali.delta650.example.com kali.whiskey402.example.com
Starting Nmap 7.95 ( https://nmap.org ) at 2025-07-25 06:01 UTC
Nmap scan report for kali.sierra998.example.com (10.3.46.240)
Host is up (0.00018s latency).
rDNS record for 10.3.46.240: ip-10-3-46-240.ec2.internal
Not shown: 996 closed tcp ports (reset)
PORT     STATE SERVICE
22/tcp   open  ssh
53/tcp   open  domain
80/tcp   open  http
3389/tcp open  ms-wbt-server
MAC Address: 02:17:CD:07:B3:15 (Unknown)

Nmap scan report for kali.delta650.example.com (10.3.47.145)
Host is up (0.00014s latency).
rDNS record for 10.3.47.145: ip-10-3-47-145.ec2.internal
Not shown: 996 closed tcp ports (reset)
PORT     STATE SERVICE
22/tcp   open  ssh
53/tcp   open  domain
80/tcp   open  http
3389/tcp open  ms-wbt-server
MAC Address: 02:5D:B3:C9:5D:6F (Unknown)

Nmap scan report for kali.whiskey402.example.com (10.3.46.219)
Host is up (0.00018s latency).
rDNS record for 10.3.46.219: ip-10-3-46-219.ec2.internal
Not shown: 997 closed tcp ports (reset)
PORT     STATE SERVICE
22/tcp   open  ssh
53/tcp   open  domain
3389/tcp open  ms-wbt-server
MAC Address: 02:23:50:2E:63:87 (Unknown)

Nmap done: 3 IP addresses (3 hosts up) scanned in 0.21 seconds
```

More info on Cyber Range [Shared-Networks](https://www.virginiacyberrange.org/courseware?q=Shared%20Networks%20Env:%20Kali%20Desktop)

