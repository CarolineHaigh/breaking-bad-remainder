#!/bin/bash
series=$1;
episode=$2;
time=48;
serieslen=$[$time*13]
seriesfive=$[$time*16]
total=$[time*62]
rem=0

if [ $series -lt 2 ];
then
	rem=$[$rem+$serieslen]
fi

if [ $series -lt 3 ];
then
	rem=$[$rem+$serieslen]
fi

if [ $series -lt 4 ];
then
	rem=$[$rem+$serieslen]
fi

if [ $series -lt 5 ];
then
	rem=$[$rem+$seriesfive]
fi

if [ $series -eq 1 ];
then
	rem=$[$rem+$[$[7-$episode]*$time]]
fi

if [ $series -ge 2 ] && [ $series -le 4 ];
then
	rem=$[$rem+$[$[13-$episode]*$time]]
fi

if [ $series -eq 5 ];
then
	rem=$[$rem+$[$[16-$episode]*$time]]
fi

percent=$[$[$total-$rem]*100/$total];
if [ $percent -le 100 ] && [ $percent -ge 0 ]
	
then echo $percent \% complete;
echo $[$rem/60] hours remaining;
fi
