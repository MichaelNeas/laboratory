# Raspberry Pis

- [Docs](https://www.raspberrypi.org/documentation/)
- [Forums](https://www.raspberrypi.org/forums)
- [Class 10](https://www.sdcard.org/developers/overview/speed_class/) or higher sd card
- [Polyfuse](https://elinux.org/Polyfuses_explained) limits current input to 1,100 mA with 700mA hold current on most models, 2,500 mA on RPi3
- HAT (Hardware Attached to Top)
- rPi is configured to request a Dynamic Host Configuration Protocol [DHCP](https://en.wikipedia.org/wiki/Dynamic_Host_Configuration_Protocol) IP Address
- Supports [ethernet crossover cable](https://en.wikipedia.org/wiki/Ethernet_crossover_cable)
- Raspi -> USB-to-TTL requires a port number, 115,200 baud, Data bits = 8 , stop bits = 1, parity = none, flow control = XON/XOFF
- [Dynamic DNS](https://en.wikipedia.org/wiki/Dynamic_DNS)
- [SSHFS](https://www.raspberrypi.org/documentation/remote-access/ssh/sshfs.md) on pi
- `extundelete` might be able to recover data
- No BIOS on rpi, no battery backup
- [Network Time Protocol](http://www.ntp.org/) synchronizes clocks between computers
- `wavemon` is good for configuring Wi-Fi connections
- On rPi CPU and GPU share DDR memory
- [rpi-update](https://github.com/Hexxeh/rpi-update) update firmware without replacing the kernel file
- `tvservice` video output application
- `ACT LED` flashes during the micro-SD card activity `led0`
- `PWR LED` indicates powered on `led1` hardwired to power supply on older models
- `sysfs` virtual file system that gives access to restricted kernel drivers and devices
- `/etc/sudoers` for adding sudo users
- _inode_ represents file sys objects like files and directories _inode table_ maintains this

#### Bootloaders
Usually when you boot a desktop computer you see _Unified Extensible Firmware Interface_ (EUFI) which provides _Basic Input/Output System_ (BIOS) services. It takes control of the computers processor, initializes and tests hardware components, and loads the OS off the SSD/HD.  Settings are stored in NAND flash and battery backed to support the  real time system clock.

Raspberry Pi does not have this and insteads uses a combination of bootloaders.  

Bootloaders initialize controllers, prepare and allocate system memory for the OS, locate the OS and provide a place to load it, then they load the OS and pass control for it.  Each bootloader is tailored on the each and every board type.  
RPi uses closed source bootloaders that were specifically developed by Broadcom. `/boot` 

1. Power is applied or the CPU invokes the reset vector to start program counter at a defined location in the boot ROM
2. Broadcom Boot Rom,  minimal peripheral config, reads the SD card and loads `bootcode.bin`
3. Bootcode.bin enables the memory, loads GPU firmware `start.elf` into top of memory
4. start elf reads config files `cmdline.txt` and `config.txt` enables CPU, loads and passes control to the linux kernel `kernel.img` uses `fixup.dat` to apportion memory between CPU and GPU
5. The kernel decompresses into memory, sets up peripherals like USB and HDMI, mounts the file system with the Linux Apps
6. Calls the first user space process `sbin/init` (systemd init) and we move from kernel context to user context

The kernel is open source and located at `/boot/kernel.img`
- machine model identified for  device tree binary to load
- default MAC address is passed as a kernel argument

The pi bootloader uses a board configuration file called device tree and binary for board specific information that kernel requires to boot.  Device tree binary files are `.dtb` and can be attached in `/boot/overlays`

- `systemctl` (system and service manager) starts and stops services like web servers and ssh.  This can start processes in parallel.  It also contains software for login management, journal logging, device management, time sync and more.

##### Kernel & User space
The kernel runs in an area of system memory called _kernel space_, user applications run in _user space_. A hard boundary is needed for security, interference, and crashing issues.  The kernel owns and has full access to all the physical memory and resources on the pi.  User applications use glibc to interact with kernel services.  

A _kernel module_ is an object file with binary code that can be loaded/unloaded from the kernel on command.
A _loadable kernel module_ can be used  without rebooting the pi, like a mouse, LKM driver files have to be maintained for  each device.    

_root_ `sudo passwd root` will give us da root password set
`sudo` _superuser do_ is used whenever you want to perform sysadmin commands, `su -` can drop you into root

##### Commands
```
$ uname -a
> Linux raspberrypi 4.19.75-v7+ #1270 SMP Tue Sep 24 18:45:11 BST 2019 armv7l GNU/Linux
$ more /etc/issue  
> Raspbian GNU/Linux 10 \n \l
$ ps -p $$
> shell currently using
$ top
> process list
$ more
> contents of a file
$ cal
> calendar
$ env
> config of linux env
$ df -kh
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        59G  5.8G   51G  11% /
devtmpfs        459M     0  459M   0% /dev
tmpfs           464M     0  464M   0% /dev/shm
tmpfs           464M  6.3M  457M   2% /run
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs           464M     0  464M   0% /sys/fs/cgroup
/dev/mmcblk0p1  253M   53M  200M  21% /boot
tmpfs            93M     0   93M   0% /run/user/1000
$ lsblk
NAME        MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
mmcblk0     179:0    0 59.5G  0 disk
├─mmcblk0p1 179:1    0  256M  0 part /boot
└─mmcblk0p2 179:2    0 59.2G  0 part /
$ tvservice --off
> Power off the tvservice and save 25-30 mA
$ sudo shutdown -h 
> Shut down board
$ sudo reboot
> Reset and reboot board
$ cat /proc/cpuinfo
> Processor information and serial number
$ systemctl
> Inspect and control the state of systemd
$ who -r
> run-level 5  2019-11-09 18:26
> describes the current state of rPi and can be used to control which process or services are started by init sys
```

##### Running Headless
```
// Disable
$ sudo systemctl isolate multi-user.target
$ systemctl list-units --type=target | grep graphical

// Enable
$ sudo systemctl isolate graphical.target

//Default
$ sudo systemctl set-default multi-user.target
$ systemctl get default
```

##### Shortcuts
- Ctrl+A: Back to the start of the line typing
- Ctrl+E: End of line
- Ctrl+U: Clears stte start of the line
- Ctrl+L  Clears the screen
- Ctrl+C kill proc
- Ctrl+Z put current proc in background

##### Package Manager
- `sudo apt install nano` install a package
- `sudo apt update` update the package index
- `sudo apt upgrade` upgrade the packages on the system
- `dpkg-query -l | grep nano` is nano installed? 
- `apt-cache search nano` is package containing string "nano" available?
- `apt-cache nano` information about package
- `apt-get download nano` download a package to current directory
- `sudo apt remove nano` remove a package
- `sudo apt-get autoremove` `sudo apt-get clean` clean up old packages