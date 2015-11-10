# -*- coding: utf-8 -*-
"""
Created on Tue Oct 13 20:24:44 2015

@author: Goutham

Topic : Social Media Data Mining
"""
import urllib

# BeautifulSoup or scrapy to used for webcrawling general websites

from bs4 import BeautifulSoup 
soup = BeautifulSoup(urllib.request.urlopen("http://espn.go.com/college-football/powerrankings").read())

result=soup.findAll('table',{'class':"tablehead"})

for row in result[0].findAll('tr'):
    tds = row('td')
    if(len(tds)==1):
        print (tds[0].string)
    else:
        print ( tds[0].string, tds[1].get_text())
