## scan-class

Simple script for scanning my classroom VMs on the cyber range.  Assumes using "shared networks" with DNS hostnames like

```
	kali.sierra998.example.com
	kali.delta650.example.com
	kali.whiskey402.example.com
```

Usage: scan-class.sh -w(reqd) [-n] [-f] host1 host2 :
```
scan-class.sh -wnf kali.sierra998.example.com kali.delta650.example.com kali.whiskey402.example.com
```

More info on Cyber Range [Shared-Networks](https://www.virginiacyberrange.org/courseware?q=Shared%20Networks%20Env:%20Kali%20Desktop)

