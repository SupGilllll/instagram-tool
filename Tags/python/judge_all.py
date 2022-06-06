import pandas as pd
import csv
import os
path = "../../log/"
file_name = "followed_infos.csv"
flag = os.path.isfile(os.path.join(path, file_name))
if not flag:
    with open(os.path.join(path, file_name),'a',encoding='utf-8-sig') as csvFile:
        writer = csv.DictWriter(csvFile,fieldnames=['id'])
        with open(os.path.join(path, file_name), "r", encoding='utf-8-sig') as f:
            reader = csv.DictReader(f)         
            writer.writeheader()    
    ids = pd.read_csv(os.path.join(path, file_name),encoding="utf-8-sig",header=None)
    id_list = ids.values.tolist()
    id_list = pd.DataFrame(id_list)
    id_list = id_list.values.flatten()
else:
    ids = pd.read_csv(os.path.join(path, file_name),encoding="utf-8-sig")
    ids = ids['id']
    id_list = ids.values.tolist()
    id_list = pd.DataFrame(id_list)
    id_list = id_list.values.flatten()
def check_follow(id):
    if id in id_list:
        result="exist"
    else:
        result="not_exist"
    return result