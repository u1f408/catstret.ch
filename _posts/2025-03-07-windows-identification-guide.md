---
title: a semi-correct windows screenshot identification guide
subtitle: ... i got nerdsniped into doing this, of course
layout: post
---

someone in a discord server i'm in asked the question "how *do* you tell windows versions apart by looking at them?" - and thus, i had to put this together.

this is not meant to be exhaustive (i'm not even going to *try* documenting betas...), and doesn't include server editions, but. here you go, nonetheless.

<!--cut-->

## contents
{:.no_toc}

* replaced with table of contents
{:toc}

## release-by-release

let's start at the top - by which i mean, the bottom, because windows 11 sucks.

### Windows 11
{: #win11}

[![screenshot of the default Windows 11 taskbar][w11taskbar]][w11taskbar]

<table>
<caption><strong>Icons</strong></caption>
<tr>
<td markdown='span'>
[![Windows 11 "My Computer" icon][ico-win11-computer]][ico-win11-computer]
</td>
<td markdown='span'>
[![Windows 11 "Show Desktop" icon][ico-win11-showdesktop]][ico-win11-showdesktop]
</td>
</tr>
<tr>
<th markdown='span'>My Computer</th>
<th markdown='span'>Show Desktop</th>
</tr>
</table>

this one's pretty easy - the Windows logo on the Start button is a four-panel square.
the taskbar is centre-aligned by default on Windows 11, but there's an option in the taskbar settings to move it to the left.

<details>
<summary markdown='span'>Full screenshot</summary>
[![screenshot of Windows 11][w11]][w11]
</details>

[ico-win11-computer]: https://archive.catstret.ch/winident/icons/win11-computer.png
[ico-win11-showdesktop]: https://archive.catstret.ch/winident/icons/win11-showdesktop.png
[w11taskbar]: https://archive.catstret.ch/winident/win11-taskbar.png
[w11]: https://archive.catstret.ch/winident/win11.png

### Windows 10
{: #win10}

[![screenshot of the default Windows 10 taskbar][w10taskbar]][w10taskbar]

<table>
<caption><strong>Icons</strong></caption>
<tr>
<td markdown='span'>
[![Windows 10 "My Computer" icon][ico-win10-computer]][ico-win10-computer]
</td>
<td markdown='span'>
[![Windows 10 "Show Desktop" icon][ico-win10-showdesktop]][ico-win10-showdesktop]
</td>
</tr>
<tr>
<th markdown='span'>My Computer</th>
<th markdown='span'>Show Desktop</th>
</tr>
</table>

Windows logo is a four-panel trapezoid (Microsoft say it's a "flag shape" but that's bullshit).

the Action Centre icon in the notification area (looks kinda like a speech bubble - between the clock and the volume control in the above screenshot) can also be a giveaway - this *can* be disabled, but it almost never is.

<details>
<summary markdown='span'>Full screenshot</summary>
[![screenshot of Windows 10][w10]][w10]
</details>

[ico-win10-computer]: https://archive.catstret.ch/winident/icons/win10-computer.png
[ico-win10-showdesktop]: https://archive.catstret.ch/winident/icons/win10-showdesktop.png
[w10taskbar]: https://archive.catstret.ch/winident/win10-taskbar.png
[w10]: https://archive.catstret.ch/winident/win10.png

### Windows 8 / 8.1
{: #win8}

[![screenshot of the default Windows 8 taskbar][w80taskbar]][w80taskbar]

[![screenshot of the default Windows 8.1 taskbar][w81taskbar]][w81taskbar]

<table>
<caption><strong>Icons</strong></caption>
<tr>
<td markdown='span'>
[![Windows 8 "My Computer" icon][ico-win8-computer]][ico-win8-computer]
</td>
<td markdown='span'>
[![Windows 8 "Show Desktop" icon][ico-win8-showdesktop]][ico-win8-showdesktop]
</td>
</tr>
<tr>
<th markdown='span'>My Computer</th>
<th markdown='span'>Show Desktop</th>
</tr>
</table>

if there's no Start button on the left-hand side, it's Windows 8. the Start button was re-added in Windows 8.1, because *everyone* hated the removal of it.
the Windows logo here is the same style as in Windows 10, but it's much larger in size in the taskbar.

the notification area icons are a similar "flat outline" style to Windows 10, but the outlines are much thicker.

see also: [Start screen differences between Windows 8 and 8.1](#comp-start-win8)

<details>
<summary markdown='span'>Windows 8</summary>
[![screenshot of Windows 8][w80]][w80]
</details>

<details>
<summary markdown='span'>Windows 8.1</summary>
[![screenshot of Windows 8.1][w81]][w81]
</details>

[ico-win8-computer]: https://archive.catstret.ch/winident/icons/win8-computer.png
[ico-win8-showdesktop]: https://archive.catstret.ch/winident/icons/win8-showdesktop.png
[w80]: https://archive.catstret.ch/winident/win80.png
[w81]: https://archive.catstret.ch/winident/win81.png
[w80taskbar]: https://archive.catstret.ch/winident/win80-taskbar.png
[w81taskbar]: https://archive.catstret.ch/winident/win81-taskbar.png

### Windows 7
{: #win7}

[![screenshot of the default Windows 7 taskbar (Aero theme)][w7taskbar]][w7taskbar]

[![screenshot of the Windows 7 taskbar (Basic theme)][w7taskbar-basic]][w7taskbar-basic]

[![screenshot of the Windows 7 taskbar ("Classic" theme)][w7taskbar-classic]][w7taskbar-classic]

<table>
<caption><strong>Icons</strong></caption>
<tr>
<td markdown='span'>
[![Windows 7 "My Computer" icon][ico-win7-computer]][ico-win7-computer]
</td>
<td markdown='span'>
[![Windows 7 "Show Desktop" icon][ico-win7-showdesktop]][ico-win7-showdesktop]
</td>
</tr>
<tr>
<th markdown='span'>My Computer</th>
<th markdown='span'>Show Desktop</th>
</tr>
</table>

now we're getting back into the era of Windows where the "Classic" theme still existed!

although Windows 7 is similar in style to Vista, Windows 7's "glass" effects are more translucent than Vista's.
Windows 7 Starter and Home Basic editions did not support the full Aero theme with translucency - these editions were limited to the Basic style.

Windows 7's taskbar is notable for introducing the ability to "pin" programs to the taskbar, and for grouping all of a program's windows into a single icon on the taskbar.
Windows 7 also adds the "Aero Peek" button (hides all windows to show your desktop) on the very end (right side) of the taskbar - although this *can* be disabled, it almost never is.

see also: [Start button (Windows 7 vs. Windows Vista)](#comp-start-vista7)

<details>
<summary markdown='span'>Aero</summary>
[![screenshot of Windows 7's Aero theme][w7-aero]][w7-aero]
</details>

<details>
<summary markdown='span'>Basic</summary>
[![screenshot of Windows 7's Basic theme][w7-basic]][w7-basic]
</details>

<details>
<summary markdown='span'>Classic</summary>
[![screenshot of Windows 7's Classic theme][w7-classic]][w7-classic]
</details>

[ico-win7-computer]: https://archive.catstret.ch/winident/icons/win7-computer.png
[ico-win7-showdesktop]: https://archive.catstret.ch/winident/icons/win7-showdesktop.png
[w7taskbar]: https://archive.catstret.ch/winident/win7-aero-taskbar.png
[w7taskbar-basic]: https://archive.catstret.ch/winident/win7-basic-taskbar.png
[w7taskbar-classic]: https://archive.catstret.ch/winident/win7-classic-taskbar.png
[w7-aero]: https://archive.catstret.ch/winident/win7-aero.png
[w7-basic]: https://archive.catstret.ch/winident/win7-basic.png
[w7-classic]: https://archive.catstret.ch/winident/win7-classic.png

### Windows Vista
{: #winvista}

[![screenshot of the default Windows Vista taskbar (Aero theme)][wvtaskbar]][wvtaskbar]

[![screenshot of the Windows Vista taskbar (Basic theme)][wvtaskbar-basic]][wvtaskbar-basic]

[![screenshot of the Windows Vista taskbar ("Classic" theme)][wvtaskbar-classic]][wvtaskbar-classic]

<table>
<caption><strong>Icons</strong></caption>
<tr>
<td markdown='span'>
[![Windows Vista "My Computer" icon][ico-winvista-computer]][ico-winvista-computer]
</td>
<td markdown='span'>
[![Windows Vista "Show Desktop" icon][ico-winvista-showdesktop]][ico-winvista-showdesktop]
</td>
</tr>
<tr>
<th markdown='span'>My Computer</th>
<th markdown='span'>Show Desktop</th>
</tr>
</table>

Windows Vista's icons are - in general - a lot brighter than Windows 7's, and far more "glossy" than Windows XP's.

like with Windows 7, the lowest-tier editions (Starter and Home Basic) are limited to the Basic theme - no Aero.

see also: [Start button (Windows 7 vs. Windows Vista)](#comp-start-vista7)

<details>
<summary markdown='span'>Aero</summary>
[![screenshot of Windows Vista's Aero theme][wv-aero]][wv-aero]
</details>

<details>
<summary markdown='span'>Basic</summary>
[![screenshot of Windows Vista's Basic theme][wv-basic]][wv-basic]
</details>

<details>
<summary markdown='span'>Classic</summary>
[![screenshot of Windows Vista's Classic theme][wv-classic]][wv-classic]
</details>

[ico-winvista-computer]: https://archive.catstret.ch/winident/icons/winvista-computer.png
[ico-winvista-showdesktop]: https://archive.catstret.ch/winident/icons/winvista-showdesktop.png
[wvtaskbar]: https://archive.catstret.ch/winident/winvista-aero-taskbar.png
[wvtaskbar-basic]: https://archive.catstret.ch/winident/winvista-basic-taskbar.png
[wvtaskbar-classic]: https://archive.catstret.ch/winident/winvista-classic-taskbar.png
[wv-aero]: https://archive.catstret.ch/winident/winvista-aero.png
[wv-basic]: https://archive.catstret.ch/winident/winvista-basic.png
[wv-classic]: https://archive.catstret.ch/winident/winvista-classic.png

### Windows XP
{: #winxp}

[![screenshot of the default Windows XP taskbar ("Luna" theme)][wxptaskbar]][wxptaskbar]

[![screenshot of the default Windows XP taskbar ("Classic" theme)][wxptaskbar-cl]][wxptaskbar-cl]

<table>
<caption><strong>Icons</strong></caption>
<tr>
<td markdown='span'>
[![Windows XP "My Computer" icon][ico-winxp-computer]][ico-winxp-computer]
</td>
<td markdown='span'>
[![Windows XP "Show Desktop" icon][ico-winxp-showdesktop]][ico-winxp-showdesktop]
</td>
</tr>
<tr>
<th markdown='span'>My Computer</th>
<th markdown='span'>Show Desktop</th>
</tr>
</table>

the golden age of Windows themeing. the Luna theme, which was blue by default, but also had "Olive Green" and "Silver" variants in the Home and Professional editions.
other editions (Media Centre Edition being the prime example) shipped with an "exclusive" Royale theme - a variant of Luna, but far glossier. Royale could be copied onto normal Windows XP machines, and many people did this back in the day.

the defining characteristic for differentiating when looking at the Windows Classic theme - compared to earlier Windows versions - is that most of the icons have been re-designed. the Windows logo in the Start button, for instance, is easily distinguishable.

<details>
<summary markdown='span'>Luna</summary>
[![screenshot of Windows XP's Luna theme][wxp-luna]][wxp-luna]
</details>

<details>
<summary markdown='span'>Luna: Olive Green</summary>
[![screenshot of Windows XP's "Olive Green" Luna theme][wxp-lunagreen]][wxp-lunagreen]
</details>

<details>
<summary markdown='span'>Luna: Silver</summary>
[![screenshot of Windows XP's "Silver" Luna theme][wxp-lunasilver]][wxp-lunasilver]
</details>

<details>
<summary markdown='span'>Royale (shipped with XP Media Centre Edition)</summary>
[![screenshot of Windows XP Media Centre Edition's Royale theme][wxp-royale]][wxp-royale]
</details>

<details>
<summary markdown='span'>Royale Noir (never officially released, but was widely leaked)</summary>
[![screenshot of Windows XP's Royale Noir theme][wxp-royalenoir]][wxp-royalenoir]
</details>

<details>
<summary markdown='span'>Zune (based on Royale, free download from Microsoft)</summary>
[![screenshot of Windows XP's Zune theme][wxp-royalezune]][wxp-royalezune]
</details>

<details>
<summary markdown='span'>Embedded (based on Royale, shipped with Windows Embedded Standard 2009)</summary>
[![screenshot of Windows XP's Embedded theme][wxp-royaleemb]][wxp-royaleemb]
</details>

<details>
<summary markdown='span'>Classic</summary>
[![screenshot of Windows XP's Classic theme][wxp-classic]][wxp-classic]
</details>

<details>
<summary markdown='span'>Classic (Starter Edition)</summary>
[![screenshot of Windows XP Starter Edition's Classic theme][wxp-classicstarter]][wxp-classicstarter]
</details>

[ico-winxp-computer]: https://archive.catstret.ch/winident/icons/winxp-computer.png
[ico-winxp-showdesktop]: https://archive.catstret.ch/winident/icons/winxp-showdesktop.png
[wxptaskbar]: https://archive.catstret.ch/winident/winxp-luna-taskbar.png
[wxptaskbar-cl]: https://archive.catstret.ch/winident/winxp-classic-taskbar.png
[wxp-luna]: https://archive.catstret.ch/winident/winxp-luna.png
[wxp-lunagreen]: https://archive.catstret.ch/winident/winxp-lunagreen.png
[wxp-lunasilver]: https://archive.catstret.ch/winident/winxp-lunasilver.png
[wxp-royale]: https://archive.catstret.ch/winident/winxp-royale.png
[wxp-royalenoir]: https://archive.catstret.ch/winident/winxp-royalenoir.png
[wxp-royalezune]: https://archive.catstret.ch/winident/winxp-royalezune.png
[wxp-royaleemb]: https://archive.catstret.ch/winident/winxp-royaleemb.png
[wxp-classic]: https://archive.catstret.ch/winident/winxp-classic.png
[wxp-classicstarter]: https://archive.catstret.ch/winident/winxp-classicstarter.png

### Windows 2000
{: #win2k}

[![screenshot of the default Windows 2000 taskbar][w2ktaskbar]][w2ktaskbar]

<table>
<caption><strong>Icons</strong></caption>
<tr>
<td markdown='span'>
[![Windows 2000 "My Computer" icon][ico-win2k-computer]][ico-win2k-computer]
</td>
<td markdown='span'>
[![Windows 2000 "Show Desktop" icon][ico-win2k-showdesktop]][ico-win2k-showdesktop]
</td>
</tr>
<tr>
<th markdown='span'>My Computer</th>
<th markdown='span'>Show Desktop</th>
</tr>
</table>

the classic Windows logo graces our taskbars!

the defining characteristic here, compared to older Windows versions, is the color scheme update. by default, Windows 2000's taskbar is a significantly less "dull" shade.

<details>
<summary markdown='span'>Full screenshot</summary>
[![screenshot of Windows 2000][w2k]][w2k]
</details>

[ico-win2k-computer]: https://archive.catstret.ch/winident/icons/win2k-computer.png
[ico-win2k-showdesktop]: https://archive.catstret.ch/winident/icons/win2k-showdesktop.png
[w2ktaskbar]: https://archive.catstret.ch/winident/win2k-taskbar.png
[w2k]: https://archive.catstret.ch/winident/win2k.png

### Windows NT 4.0
{: #winnt4}

[![screenshot of the default Windows NT 4.0 taskbar][nt4taskbar]][nt4taskbar]

<table>
<caption><strong>Icons</strong></caption>
<tr>
<td markdown='span'>
[![Windows NT 4 "My Computer" icon][ico-winnt4-computer]][ico-winnt4-computer]
</td>
<td markdown='span'>
[![Windows NT 4 "Show Desktop" icon][ico-winnt4-showdesktop]][ico-winnt4-showdesktop]
</td>
</tr>
<tr>
<th markdown='span'>My Computer</th>
<th markdown='span'>Show Desktop</th>
</tr>
</table>

if it looks like Windows 98, but it doesn't crash every 30 seconds, it's probably Windows NT 4.

i'll have to come back to this and figure out a better at-a-glance way to differentiate if the wallpaper isn't set to the default one - expand the full screenshot just below and you'll see what i mean...

<details>
<summary markdown='span'>Full screenshot</summary>
[![screenshot of Windows NT Workstation 4.0][nt4]][nt4]
</details>

[ico-winnt4-computer]: https://archive.catstret.ch/winident/icons/winnt4-computer.png
[ico-winnt4-showdesktop]: https://archive.catstret.ch/winident/icons/winnt4-showdesktop.png
[nt4taskbar]: https://archive.catstret.ch/winident/nt4-taskbar.png
[nt4]: https://archive.catstret.ch/winident/nt4.png

### Windows ME
{: #winme}

[![screenshot of the default Windows ME taskbar][wmetaskbar]][wmetaskbar]

<table>
<caption><strong>Icons</strong></caption>
<tr>
<td markdown='span'>
[![Windows ME "My Computer" icon][ico-winme-computer]][ico-winme-computer]
</td>
<td markdown='span'>
[![Windows ME "Show Desktop" icon][ico-winme-showdesktop]][ico-winme-showdesktop]
</td>
</tr>
<tr>
<th markdown='span'>My Computer</th>
<th markdown='span'>Show Desktop</th>
</tr>
</table>

Windows ME uses the icons & colour scheme as Windows 2000, but uses the same UI font as Windows 95 / 98.

<details>
<summary markdown='span'>Full screenshot</summary>
[![screenshot of Windows ME][wme]][wme]
</details>

[ico-winme-computer]: https://archive.catstret.ch/winident/icons/winme-computer.png
[ico-winme-showdesktop]: https://archive.catstret.ch/winident/icons/winme-showdesktop.png
[wmetaskbar]: https://archive.catstret.ch/winident/winme-taskbar.png
[wme]: https://archive.catstret.ch/winident/winme.png

### Windows 98

[![screenshot of the default Windows 98 taskbar][w98taskbar]][w98taskbar]

<table>
<caption><strong>Icons</strong></caption>
<tr>
<td markdown='span'>
[![Windows 98 "My Computer" icon][ico-win98-computer]][ico-win98-computer]
</td>
<td markdown='span'>
[![Windows 98 "Show Desktop" icon][ico-win98-showdesktop]][ico-win98-showdesktop]
</td>
</tr>
<tr>
<th markdown='span'>My Computer</th>
<th markdown='span'>Show Desktop</th>
</tr>
</table>

<details>
<summary markdown='span'>Full screenshot</summary>
[![screenshot of Windows 98][w98]][w98]
</details>

[ico-win98-computer]: https://archive.catstret.ch/winident/icons/win98-computer.png
[ico-win98-showdesktop]: https://archive.catstret.ch/winident/icons/win98-showdesktop.png
[w98taskbar]: https://archive.catstret.ch/winident/win98-taskbar.png
[w98]: https://archive.catstret.ch/winident/win98.png

### Windows 95
{: #win9x}

[![screenshot of the default Windows 95 taskbar][w95taskbar]][w95taskbar]

<table>
<caption><strong>Icons</strong></caption>
<tr>
<td markdown='span'>
[![Windows 95 "My Computer" icon][ico-win95-computer]][ico-win95-computer]
</td>
<td markdown='span'>
[![Windows 95 "Show Desktop" icon][ico-win95-showdesktop]][ico-win95-showdesktop]
</td>
</tr>
<tr>
<th markdown='span'>My Computer</th>
<th markdown='span'>Show Desktop</th>
</tr>
</table>

<details>
<summary markdown='span'>Full screenshot</summary>
[![screenshot of Windows 95][w95]][w95]
</details>

[ico-win95-computer]: https://archive.catstret.ch/winident/icons/win95-computer.png
[ico-win95-showdesktop]: https://archive.catstret.ch/winident/icons/win95-showdesktop.png
[w95taskbar]: https://archive.catstret.ch/winident/win95-taskbar.png
[w95]: https://archive.catstret.ch/winident/win95.png

### Windows NT 3.x / Windows 3.x
{: #win3x}

[![screenshot of the Windows NT 3.51 Program Manager][nt3x]][nt3x]

and this is now the pre-Windows Explorer era!

if you're looking at a Program Manager screenshot, and it has a `DOMAIN\username` in the title bar, it's Windows NT 3.x - otherwise, it's Windows 3.

[nt3x]: https://archive.catstret.ch/winident/nt3x.png

### Windows 2.x (a.k.a. Windows/286 and Windows/386)
{: #win2x}

[![screenshot of Windows/386 2.1][win2x]][win2x]

i don't think i need to say anything here.

[win2x]: https://archive.catstret.ch/winident/win2x.png

### Windows 1.0
{: #win1x}

[![screenshot of Windows 1.04][win1x]][win1x]

i **really** don't think i need to say anything here.

[win1x]: https://archive.catstret.ch/winident/win1x.png

## comparisons

### Start button (Windows 7 vs. Windows Vista)
{: #comp-start-vista7}

the Start button orb extends past the edge of the taskbar by default in Vista, but it can also do this on Windows 7 (if the option to use small taskbar icons is turned on).

the "bloom" effect in the centre of the flag panels of the Windows logo is far more prominent on Vista than on 7 - especially so in the Classic theme's Start button.

<table>
<tr>
<th markdown='span'>7 (Aero, small icons)</th>
<th markdown='span'>7 (Aero, large icons)</th>
<th markdown='span'>7 (Classic, small icons)</th>
<th markdown='span'>7 (Classic, large icons)</th>
</tr>
<tr>
<td markdown='span'>
[![Windows 7 start button with small taskbar icons][w7start-small]][w7start-small]
</td>
<td markdown='span'>
[![Windows 7 start button with large taskbar icons][w7start-large]][w7start-large]
</td>
<td markdown='span'>
[![Windows 7 Classic start button with small taskbar icons][w7start-small-classic]][w7start-small-classic]
</td>
<td markdown='span'>
[![Windows 7 Classic start button with large taskbar icons][w7start-large-classic]][w7start-large-classic]
</td>
</tr>
<tr>
<th markdown='span'>Vista (Aero, default)</th>
<th markdown='span'>Vista (Aero, large taskbar)</th>
<th markdown='span'>Vista (Classic, default)</th>
<th markdown='span'>Vista (Classic, large taskbar)</th>
</tr>
<tr>
<td markdown='span'>
[![Windows Vista start button][wvstart-small]][wvstart-small]
</td>
<td markdown='span'>
[![Windows Vista start button with the taskbar upsized one notch][wvstart-large]][wvstart-large]
</td>
<td markdown='span'>
[![Windows Vista Classic start button][wvstart-small-classic]][wvstart-small-classic]
</td>
<td>
<div style="text-align:center">(...)</div>
<!-- i haven't found a screenshot for this yet and i don't want to install vista in a VM for just this...
[![Windows Vista Classic start button with the taskbar upsized one notch][wvstart-large]][wvstart-large]
-->
</td>
</tr>
</table>

[w7start-small]: https://archive.catstret.ch/winident/win7-start-small.png
[w7start-large]: https://archive.catstret.ch/winident/win7-start-large.png
[w7start-small-classic]: https://archive.catstret.ch/winident/win7-start-small-classic.png
[w7start-large-classic]: https://archive.catstret.ch/winident/win7-start-large-classic.png
[wvstart-small]: https://archive.catstret.ch/winident/winvista-start-small.png
[wvstart-large]: https://archive.catstret.ch/winident/winvista-start-large.png
[wvstart-small-classic]: https://archive.catstret.ch/winident/winvista-start-small-classic.png
[wvstart-large-classic]: https://archive.catstret.ch/winident/winvista-start-large-classic.png

### Start screen differences between Windows 8 and 8.1
{: #comp-start-win8}

Windows 8's "Metro" Start screen lacks the arrow icon at the bottom left (which is clickable to show the full app list) -
this was added in Windows 8.1 (along with the Start button on the taskbar) to make things more mouse-friendly again.

<table>
<tr>
<th markdown='span'>Windows 8 RTM</th>
<th markdown='span'>Windows 8.1 RTM</th>
</tr>
<tr>
<td markdown='span'>
[![Windows 8 RTM start screen][w80startpage]][w80startpage]
</td>
<td markdown='span'>
[![Windows 8.1 RTM start screen][w81startpage]][w81startpage]
</td>
</tr>
</table>

<details>
<summary markdown='span'>Bonus: Windows RT 8.1's Start menu</summary>
[The last update for Windows RT 8.1][betawiki_w81rt_upd3] added a real Start menu again!
This was meant to be added to non-RT Windows 8.1 also, but the plans for that changed in favour of prioritising Windows 10... so Windows 8 never got a "normal" Start menu.

[![Windows RT 8.1 start menu][w81rtstart]][w81rtstart]
</details>

[w80startpage]: https://archive.catstret.ch/winident/win80-start.png
[w81startpage]: https://archive.catstret.ch/winident/win81-start.png
[w81rtstart]: https://archive.catstret.ch/winident/win81rt-start.png
[betawiki_w81rt_upd3]: https://betawiki.net/wiki/Windows_8.1_build_9600.17415

### other miscellaneous differences
{: #comp-misc}

in no particular order:

* if there is a keyboard layout selector in the form of a blue square on the taskbar, look at the capitalisation
    * if all the letters are capitalised (eg. `PL`) it's NT
    * if only the first letter is capitalised (eg. `Pl`) it's 9x

## shoutouts
{: #greetz}

* a lot of the screenshots here came from [BetaWiki.net](https://betawiki.net), which is a fantastic resource
* a number of people on the fediverse brought up more points of differentiation than i'd written initally:
    * [@nblr@chaos.social](https://chaos.social/@nblr) - [suggested adding the icons](https://chaos.social/@nblr/114120685670749931)
    * [@Lili@donotsta.re](https://donotsta.re/Lili) - [a bunch of stuff](https://donotsta.re/notice/AroH9gIcatdo7IBixU)

