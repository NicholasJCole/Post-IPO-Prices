#use this file to get rid of urls without tables that will cause errors in R


import csv
import mechanize
from BeautifulSoup import BeautifulSoup
import urllib2
import time

rdata = []
with open('totalpricings_cleaned.csv', 'rb') as csvfile:
    spamreader = csv.reader(csvfile, delimiter =',')
    for row in spamreader:
        rdata.append(row)


def get_html(target_url):
    br = mechanize.Browser()
    br.set_handle_robots(False)
    try:
        r = br.open(target_url)
        html = r.read()
    except urllib2.URLError as e:
        html = e.reason
    return html

base_url = 'http://ichart.finance.yahoo.com/table.csv?s='


for i in range(0, len(rdata)):#len(rdata)):
    # print(rdata[i][2])
    full_url = base_url + rdata[i][2]
    html = get_html(full_url)
    if html == 'Not Found':
        rdata[i].append('HTML Not Found')
    else:
        rdata[i].append('HTML Found')
    print rdata[i]
    time.sleep(1)
        
writer = csv.writer(open('totalpricings_lessduds', 'w'))
for row in rdata:
    writer.writerow(row)
    
    
