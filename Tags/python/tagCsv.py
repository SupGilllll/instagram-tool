
import csv
import os
import confige
from copy import deepcopy
def entered_spot_writeCsv(headers,row):
    with open('like_spot_infos.csv','a',encoding='utf-8-sig') as csvFile:
        writer = csv.DictWriter(csvFile,fieldnames=headers)
        with open('like_spot_infos.csv', "r", encoding='utf-8-sig') as f:
            reader = csv.DictReader(f)
            if not [row for row in reader]:            
                 writer.writeheader()
                 writer.writerow(row)
            else:
                 writer.writerow(row)
def entered_keyword_writeCsv(headers,row):
    with open('like_keyword_infos.csv','a',encoding='utf-8-sig') as csvFile:
        writer = csv.DictWriter(csvFile,fieldnames=headers)
        with open('like_keyword_infos.csv', "r", encoding='utf-8-sig') as f:
            reader = csv.DictReader(f)
            if not [row for row in reader]:            
                 writer.writeheader()
                 writer.writerow(row)
            else:
                 writer.writerow(row)
def entered_famous_writeCsv(headers,row):
    with open('like_famous_infos.csv','a',encoding='utf-8-sig') as csvFile:
        writer = csv.DictWriter(csvFile,fieldnames=headers)
        with open('like_famous_infos.csv', "r", encoding='utf-8-sig') as f:
            reader = csv.DictReader(f)
            if not [row for row in reader]:            
                 writer.writeheader()
                 writer.writerow(row)
            else:
                 writer.writerow(row)
def clearCsv(ac='all'):
    if ac == 'all':
        if os.path.isfile('C:\luc\tagui\src\like_spot_infos.csv'): 
            os.remove('C:\luc\tagui\src\like_spot_infos.csv')
        if os.path.isfile('C:\luc\tagui\src\like_keyword_infos.csv'):
            os.remove('C:\luc\tagui\src\like_keyword_infos.csv')
        if os.path.isfile('C:\luc\tagui\src\like_famous_infos.csv'):
            os.remove('C:\luc\tagui\src\like_famous_infos.csv')
      