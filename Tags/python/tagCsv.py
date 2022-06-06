# -*- coding: utf-8 -*-
import csv
import os
import confige
import datetime
import pandas as pd
from copy import deepcopy
Path = os.getcwd()
dir1=os.path.dirname(Path)
dir2=os.path.dirname(dir1)
dir3=dir2+'/log'
isExists=os.path.exists(dir3)
if not isExists:
    os.makedirs(dir3) 
def entered_spot_writeCsv(headers,row):
    with open('../../log/like_spot_infos.csv','a',encoding='utf-8-sig') as csvFile:
        writer = csv.DictWriter(csvFile,fieldnames=headers)
        with open('../../log/like_spot_infos.csv', "r", encoding='utf-8-sig') as f:
            reader = csv.DictReader(f)
            if not [row for row in reader]:            
                 writer.writeheader()
                 writer.writerow(row)
            else:
                 writer.writerow(row)
def entered_keyword_writeCsv(headers,row):
    with open('../../log/like_keyword_infos.csv','a',encoding='utf-8-sig') as csvFile:
        writer = csv.DictWriter(csvFile,fieldnames=headers)
        with open('../../log/like_keyword_infos.csv', "r", encoding='utf-8-sig') as f:
            reader = csv.DictReader(f)
            if not [row for row in reader]:            
                 writer.writeheader()
                 writer.writerow(row)
            else:
                 writer.writerow(row)
def entered_famous_writeCsv(headers,row):
    with open('../../log/like_famous_infos.csv','a',encoding='utf-8-sig') as csvFile:
        writer = csv.DictWriter(csvFile,fieldnames=headers)
        with open('../../log/like_famous_infos.csv', "r", encoding='utf-8-sig') as f:
            reader = csv.DictReader(f)
            if not [row for row in reader]:            
                 writer.writeheader()
                 writer.writerow(row)
            else:
                 writer.writerow(row)
def entered_followed_three_writeCsv(headers,row):
    path = "../../log/"
    file_name = "followed_infos_" + datetime.datetime.today().strftime('%Y-%m-%d') + ".csv"
    with open(os.path.join(path, file_name),'a',encoding='utf-8-sig') as csvFile:
        writer = csv.DictWriter(csvFile,fieldnames=headers)
        with open(os.path.join(path, file_name), "r", encoding='utf-8-sig') as f:
            reader = csv.DictReader(f)
            if not [row for row in reader]:            
                 writer.writeheader()
                 writer.writerow(row)
            else:
                 writer.writerow(row)
def entered_followed_all_writeCsv(headers,row):
    with open("../../log/followed_infos.csv",'a',encoding='utf-8-sig') as csvFile:
        writer = csv.DictWriter(csvFile,fieldnames=headers)
        with open("../../log/followed_infos.csv", "r", encoding='utf-8-sig') as f:
            reader = csv.DictReader(f)
            if not [row for row in reader]:            
                 writer.writeheader()
                 writer.writerow(row)
            else:
                 writer.writerow(row)
def entered_judge_begin_writeCsv(headers,row):
    with open('../../log/state_judge_infos.csv','w',encoding='utf-8-sig',newline='' "") as csvFile:
        writer = csv.DictWriter(csvFile,fieldnames=headers)
        with open('../../log/state_judge_infos.csv', "r", encoding='utf-8-sig') as f:
            reader = csv.DictReader(f)
            if not [row for row in reader]:
                 writer.writeheader()
                 writer.writerow(row)
            else:
                 writer.writerow(row)
def entered_judge_writeCsv(headers,row):
    with open('../../log/state_judge_infos.csv','a',encoding='utf-8-sig',newline='' "") as csvFile:
        writer = csv.DictWriter(csvFile,fieldnames=headers)
        with open('../../log/state_judge_infos.csv', "r", encoding='utf-8-sig') as f:
            reader = csv.DictReader(f)
            if not [row for row in reader]:
                 writer.writeheader()
                 writer.writerow(row)
            else:
                 writer.writerow(row)
def put_judge_readCsv():
    with open('../../log/state_judge_infos.csv', "r", encoding='utf-8-sig') as f:
        reader = csv.reader(f)
        column = [row[0] for row in reader]
        return column

#清除所有记录
def clearCsv(ac='all'):
    if ac == 'all':
        if os.path.isfile('../../log/like_spot_infos.csv'): 
            os.remove('../../log/like_spot_infos.csv')
        if os.path.isfile('../../log/like_keyword_infos.csv'):
            os.remove('../../log/like_keyword_infos.csv')
        if os.path.isfile('../../log/like_famous_infos.csv'):
            os.remove('../../log/like_famous_infos.csv')
        if os.path.isfile('../../log/followed_infos.csv'):
            os.remove('../../log/followed_infos.csv')
      