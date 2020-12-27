# worldunseen overlay
My personal Gentoo repo of packages that I want but aren't on the main repo. 
I can't guarantee anything, but the ebuilds that I mark stable are done with some conviction.

## Installation

Add this to your ```repos.conf``` folder/file:

```
[worldunseen]
location = /var/db/repos/worldunseen
sync-type = git
sync-uri = https://github.com/worldunseen/overlay.git
```

or use ```eselect repository```:

```bash
# as root
eselect repository add worldunseen git https://github.com/worldunseen/overlay.git
emerge --sync worldunseen
```
