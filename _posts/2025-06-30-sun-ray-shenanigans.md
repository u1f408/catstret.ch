---
title: using Sun Ray thin clients in 2025
subtitle: setting up 20 year old hardware is bound to work first try, right? ... right?
layout: post
tags:
  - thin-clients
  - hardware
  - illumos
  - deepdive
---

i've used thin clients at home for quite a while - both for their *intended* use (remotely accessing a desktop of another system); and in the sense of "modern thin clients are x86 boxes that are wildly overpowered for what they run, so they make good mini servers."

recently, i saw a bulk lot of Sun Ray thin clients pop up on Trade Me (NZ's eBay-like auction site) - and with very little idea of how many clients were actually included in this lot, i jumped on it. after a 9 hour round-trip drive (on some of the worst roads i've seen!), i returned home with the back of my car completely packed with Sun Rays. time for some interesting shenanigans!

<!--cut-->

## sections
{:.no_toc}

* replaced with table of contents
{:toc}

## cataloguing the haul

when picking all of these up from the seller, i had guesstimated there was maybe 30 clients in total. turns out i was off by quite a bit. 

i ended up bringing home:

- 12x [Sun Ray 2][hw-sr2]
- 12x [Sun Ray 2FS][hw-sr2fs]
- 11x [Sun Ray 3][hw-sr3]
- 4x [Sun Ray 3+][hw-sr3plus]
- 3x [Sun Ray 270][hw-sr270] - 17" (1280x1024) LCD screens with integrated Sun Ray clients
- 4x [Incarta Uvo][hw-uvo] - 24" 1080p LCD screens with integrated clients
    - i can't find any info about these other than the linked page on the Wayback Machine - if you know more about these, please send me an email!
- about 40 smart cards, for authentication/hotdesking
- a small pile of Sun Type 7 USB keyboards, and some Sun-branded optical mice

so that's **46** clients all up!

a few days prior to picking all this up, i rented a storage unit in a local facility, and put some garage shelving units in there - and boy howdy i'm glad i did!

[hw-sr2]: https://dogemicrosystems.ca/pub/Sun/System_Handbook/Sun_syshbk_V3.4/Systems/SunRay2/SunRay2.html
[hw-sr2fs]: https://dogemicrosystems.ca/pub/Sun/System_Handbook/Sun_syshbk_V3.4/Systems/SunRay2FS/SunRay2FS.html
[hw-sr3]: https://dogemicrosystems.ca/pub/Sun/System_Handbook/Sun_syshbk_V3.4/Systems/SunRay3/
[hw-sr3plus]: https://dogemicrosystems.ca/pub/Sun/System_Handbook/Sun_syshbk_V3.4/Systems/SunRay3_Plus/SunRay3_Plus.html
[hw-sr270]: https://dogemicrosystems.ca/pub/Sun/System_Handbook/Sun_syshbk_V3.4/Systems/SunRay270/SunRay270.html
[hw-uvo]: https://web.archive.org/web/20170218173523/https://incarta.com.au/uvo

## setting up the Sun Ray Server Software

looking at the Oracle (eugh.) documentation for the Sun Ray Server Software, it appeared there were two options: run it on ancient Linux, or run it on ancient Solaris. Oracle dropped support for the Sun Rays in 2014, as part of extinguishing everything Sun Microsystems stood for after the 2010 acquisition. i didn't *really* want to have a RHEL 6 box kicking around, nor did i want to deal with trying to make Solaris 10 work in a VM on my home Proxmox cluster, so i did some digging.

enter **illumos** - well, in my case, OpenIndiana. illumos is, essentially, a fork of the pre-Oracle-acquisition OpenSolaris codebase. OpenIndiana is one of many illumos *distributions* (in a very similar sense to Linux distributions), and OpenIndiana is more suited for desktop use than most other illumos distributions. the OpenIndiana documentation has [a section on setting up the Sun Ray Server Software on OpenIndiana][oi-doc-sunray], but even with that in hand there was a lot of pieces to figure out on my own!

[oi-doc-sunray]: https://docs.openindiana.org/handbook/sunray/

### getting SRSS installed on OpenIndiana

this is mostly a copy of the docs from the OpenIndiana handbook, with some adjustments to fix things i ran into. i did this on top of a text-only install - `OpenIndiana Hipster 2025.04 Text Install DVD (64-bit x86)` was the install media i used (from <https://www.openindiana.org/downloads/>).

to get the desktop environment installed:

```
# pkg install mate_install
```

unlocking the dependencies for SRSS:

```
# pkg change-facet facet.version-lock.gnome/gnome-session=false
# pkg change-facet facet.version-lock.gnome/gnome-settings-daemon=false
# pkg change-facet facet.version-lock.system/display-manager/gdm=false
# pkg change-facet facet.version-lock.library/gnome/libgnomekbd=false
# pkg change-facet facet.version-lock.gnome/window-manager/metacity=false
# pkg change-facet facet.version-lock.library/desktop/gnome-desktop=false
# pkg change-facet facet.version-lock.cde/cde-runtime=false
# pkg change-facet facet.version-lock.library/motif=false
# pkg change-facet facet.version-lock.library/tooltalk=false
# pkg change-facet facet.version-lock.compatibility/packages/SUNWxwplt=false
```

setting up the package source, and installing the SRSS dependencies:

```
# pkg set-publisher --search-before=openindiana.org -g http://pkg.toc.de/sunray sunray
# pkg set-publisher --non-sticky openindiana.org
# pkg install sunray-essential
```

after unpacking the Sun Ray Server Software installers (both the Solaris and Linux versions) into `/root`, i ran the `update_dhcp_dependency` script from the OI Handbook, then tried to install SRSS, which bombed out spectacularly with package manager rejections of the `This version is excluded by installed incorporation consolidation/userland/userland-incorporation@...` sort. so here's the correct (read: "worked for me!") steps:

```
# /root/update_dhcp_dependency /root/srs_5.4.0.0-Solaris_11plus.i386/IPS.i386/
# pkg set-publisher -g /root/srs_5.4.0.0-Solaris_11plus.i386/IPS.i386/ sunray
# pkg uninstall entire userland-incorporation
# pkg install SUNWut-srss SUNWut-srwc SUNWuti
```

<details>
<summary markdown='span'>the `update_dhcp_dependency` script, for posterity</summary>
{% highlight shell %}
{% include_snippet openindiana-srss-update_dhcp_dependency.sh %}
{% endhighlight %}

([direct link]({{ site.baseurl }}/snippets/openindiana-srss-update_dhcp_dependency.sh))
</details>

to make SRSS happy with isc-dhcp:

```
# rpm2cpio /root/srs_5.4.0.0-Linux.i386/Components/10-SRSS/Content/Sun_Ray_Core_Services_4.5/Linux/Packages/SUNWuto-4.5-44.i386.rpm | bsdtar -C /root -xf - ./opt/SUNWut/lib/dhcp/
# sed 's#$UTDHCPDIR | sort#$UTDHCPDIR | gsort#g' -i.bak /root/opt/SUNWut/lib/dhcp/isc/dhcp_config_linux 
# cp -R /root/opt/SUNWut/lib/dhcp/isc /opt/SUNWut/lib/dhcp/
# cp /opt/SUNWut/lib/dhcp/isc/dhcp_config_linux /opt/SUNWut/lib/dhcp/isc/dhcp_config_solaris
# ln -s /opt/SUNWut/lib/dhcp/isc /etc/opt/SUNWut/dhcp
```

then apply [the needed patch]({{ site.baseurl }}/snippets/openindiana-srss-utadm.patch) to `/opt/SUNWut/sbin/utadm`:

{% highlight patch %}
{% include_snippet openindiana-srss-utadm.patch %}
{% endhighlight %}

now, get the ancient JRE in place:

```
# cd /root/srs_5.4.0.0-Solaris_11plus.i386/Supplemental/Java_Runtime_Environment/Solaris
# ./jre-6u41-solaris-i586.sh
# mv ./jre1.6.0_41 /opt/
# ln -s /opt/jre1.6.0_41 /etc/opt/SUNWut/jre
```

and, since i wanted the web administration tools to work too:

```
# bsdtar -C /opt -xf /root/srs_5.4.0.0-Solaris_11plus.i386/Supplemental/Apache_Tomcat/apache-tomcat-5.5.36.tar.gz
# ln -s /opt/apache-tomcat /opt/apache-tomcat-5.5.36
```

i then configured the Sun Ray server:

```
# /opt/SUNWut/sbin/utconfig
# /opt/SUNWut/sbin/utpolicy -a -z both -g -M
# /opt/SUNWut/sbin/utadm -L on
# /opt/SUNWut/sbin/utstart -c
```

and...

[![a Sun Ray 270, with a smart card inserted, showing a MATE desktop on OpenIndiana][pic-sr270-mate]][pic-sr270-mate]

[pic-sr270-mate]: https://archive.catstret.ch/media/sr270-mate.jpg

it fuckin' worked!

### getting the Sun Ray firmware in place

since i was using version 5.4.x of the Sun Ray Server Software, the client firmware wasn't part of the install - from version 5.3 onwards, you had to have an Oracle support contract to get firmware updates. sigh.

thankfully, getting a 5.2.x release (with the firmware included!) wasn't hard. i grabbed a 5.2.x release for Linux, found the RPM with the firmware in it (`SUNWutfw04.3-50.i386.rpm`), and extracted that with `rpm2cpio`.

the Solaris version of SRSS wants to find the firmware in a different place than the Linux version it seems - the Linux versions put it in `/opt/SUNWut/lib/firmware`, but on Solaris/OpenIndiana, it needs to be in `/opt/SUNWutdfw/lib/firmware`. easy enough.

once in place, this was all it took to set up the TFTP server, and make SRSS populate the right places with the firmware:

```
# mkdir /tftpboot
# cd /tftpboot
# ln -f -s . tftpboot
# /opt/SUNWut/sbin/utfwadm -AaV -G force
```

## kiosk sessions

i wanted to use some of the integrated-into-screens Sun Rays to replace some of the Raspberry Pis (and old iMacs) around the house showing Home Assistant dashboards. i also wanted to set up the Sun Ray server so that when i inserted a particular smart card into a client, it would bring up an RDP session to my existing "desktop" (a Fedora VM running Xrdp).

these both turned out to be... interesting to get working.

### RDP

the Sun Ray Server Software has a built-in method for connecting to Microsoft RDP servers - the Sun Ray Windows Connector, also known as `uttsc`.
as you might have guessed, it's broken as fuck on OpenIndiana, even putting aside the fact that the newest RDP server it knows how to handle would be in the Windows Server 2003 era.

so, let's hack something together with XFreeRDP!

i wanted to be able to specify what RDP server each token would connect to. this was a fairly common use case back in the day, and some people wrote helpers to allow things like that - one of which being [Daniel Cifuentes' meta-kiosk][wayback-metakiosk], which i borrowed some ideas from.

[wayback-metakiosk]: https://web.archive.org/web/20131212042126/https://blogs.oracle.com/danielc/entry/meta_kiosk_how_to_run

after much trial and error, i got something working!

<details>
<summary markdown='span'>`/etc/opt/SUNWkio/sessions/freerdp.conf`</summary>
```shell
KIOSK_SESSION_EXEC=$KIOSK_SESSION_DIR/freerdp
KIOSK_SESSION_LABEL="FreeRDP session"
```
</details>

<details>
<summary markdown='span'>`/etc/opt/SUNWkio/sessions/freerdp/freerdp`</summary>
{% highlight shell %}
{% include_snippet openindiana-srss-freerdp.sh %}
{% endhighlight %}

([direct link]({{ site.baseurl }}/snippets/openindiana-srss-freerdp.sh))
</details>

after throwing those in place, install the dependencies and configure the session:

```
# pkg install openbox freerdp
# printf "KIOSK_SESSION=freerdp\n" | /opt/SUNWut/sbin/utkiosk -i FreeRDP
```

then it's just a matter of adding the needed data to each token, and assigning the tokens to the FreeRDP session:

[![the Sun Ray Administration web UI, editing a token to use kiosk mode and specifying the FreeRDP parameters][pic-srss-token-freerdp]][pic-srss-token-freerdp]

```
# /opt/SUNWut/sbin/utkioskoverride -s kiosk -r OpenPlatform.47905167523905788499 -c FreeRDP
```

upon inserting that token into a client...

[![an Incarta Uvo, showing an Xrdp login screen][pic-srss-uvo-freerdp]][pic-srss-uvo-freerdp]

**success!**

[pic-srss-token-freerdp]: https://archive.catstret.ch/media/srss-token-freerdp.png
[pic-srss-uvo-freerdp]: https://archive.catstret.ch/media/srss-uvo-freerdp.jpg

### browser sessions

with much the same setup as the RDP sessions, it's pretty easy to start a kiosk-mode Firefox, pulling the URL to open from the token data:

<details>
<summary markdown='span'>`/etc/opt/SUNWkio/sessions/kiosk-browser.conf`</summary>
```shell
KIOSK_SESSION_EXEC=$KIOSK_SESSION_DIR/kiosk-browser
KIOSK_SESSION_LABEL="Kiosk Browser"
```
</details>

<details>
<summary markdown='span'>`/etc/opt/SUNWkio/sessions/kiosk-browser/kiosk-browser`</summary>
{% highlight shell %}
{% include_snippet openindiana-srss-kiosk-browser.sh %}
{% endhighlight %}

([direct link]({{ site.baseurl }}/snippets/openindiana-srss-kiosk-browser.sh))
</details>

i needed to hide the mouse cursor, and `unclutter` simply *does not* work in Sun Ray sessions, so i went with an invisible cursor theme - <https://github.com/l-theanine/invisible-cursor-theme> works well.

a problem, though. Firefox would show its first-run "Welcome to Firefox" popup... every time. Sun Ray kiosk sessions run as a random user named  `utkuXX` (where `XX` is a number), and after the kiosk session ends the home directory of the kiosk user gets fully deleted, so the user can be recycled for other sessions. given i wanted to use this with some always-on Sun Rays, with no input devices attached... 

thankfully, Firefox policies allow turning that off! throwing [a particular hunk of JSON]({{ site.baseurl }}/snippets/openindiana-srss-firefox-policies.json) into `/etc/firefox/policies/policies.json` fixed that:

{% highlight json %}
{% include_snippet openindiana-srss-firefox-policies.json %}
{% endhighlight %}

and with that, i could create a token for an individual client (the tokens for this are `pseudo.<MAC>`, where the MAC is all lower-case), set that token's "Other Info" field to the URL to show, and assign the kiosk session to that pseudo-token the same way as with smart card tokens.

## where to from here?

this was a lot of fun to get working. i need to take a break from reading the Sun Ray Administration Guide though, so here's my thinking for a potential part 2:

- i want to see how well the multi-head stuff works in SRSS - which joins multiple physical clients together into one desktop session, using the peripherals connected to the "primary" client. unfortunately the Xinerama support is weird (Xinerama and xrandr are mutually exclusive...), but if i can make it play ball it could be a neat thing to use.
- i want to try and find a newer firmware package too, but that might be a little bit of a lost cause, given i refuse to give Oracle a bunch of money.
- maybe i'll set up another OpenIndiana VM and configure the HA failover in SRSS?

for now, though... that's all.
