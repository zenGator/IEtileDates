# IEtileDates
Extract create and access dates from IE Pinned Tile

Presented in IE as "Top Sites"
msapplication.xml files in \Users\[user]\AppData\Local\Microsoft\Internet Explorer\Tiles\pin-[digits]\msapplication.xml

example:<br>
\<?xml version="1.0" encoding="utf-8"?>
\<browserconfig>\<msapplication>\<config>\<site src="http://www.nirsoft.net/"/> <b>\<date>0x918cbab8,0x01d6e2e5\</date>\<accdate>0x918d55eb,0x01d6e2e5\</accdate></b>\</config>\<tile>\<wide310x150logo/>\<square310x310logo/>\<square70x70logo/>\<favorite src="C:\Users\lwolfenden\Favorites\NirSoft - freeware utilities password recovery, system utilities, desktop utilities.url"/>\</tile>\</msapplication>\</browserconfig>

The dates are represented as two 4-byte words which need to be reversed and then converted from Windows FileTime to human-readable form.

Per https://docs.microsoft.com/en-us/dotnet/api/system.datetime.fromfiletime?view=net-5.0:
<br><i>A Windows file time is a 64-bit value that represents the number of 100-nanosecond intervals that have elapsed since 12:00 midnight, January 1, 1601 A.D. (C.E.) Coordinated Universal Time (UTC). Windows uses a file time to record when an application creates, accesses, or writes to a file. </i></li>
