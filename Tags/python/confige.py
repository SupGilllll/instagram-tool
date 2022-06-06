# -*- coding: utf-8 -*-
import configparser
import random

conf = configparser.ConfigParser()

conf.read("../../rule.ini", encoding="utf-8")

#读取配置文件中的各项参数
username = conf.get("default","username")
password = conf.get("default","password")
pages = conf.get("default","pages")
like_max_numbers = conf.get("default","like_max_numbers")
follow_max_numbers = conf.get("default","follow_max_numbers")
unfollow_max_numbers = conf.get("default","unfollow_max_numbers")
time_upper_limit = int(conf.get("default","time_upper_limit"))
time_lower_limit = int(conf.get("default","time_lower_limit"))


spot  = conf['default']['spot']
spot  = spot.split(',')

key_word = conf['default']['keyword']
key_word = key_word.split(',')

famous_person = conf['default']['famous_person']
famous_person = famous_person.split(',')

key_order=conf.get("default","key_order")
famous_order=conf.get("default","fans_order")
spot_order=conf.get("default","spot_order")

#在每次读取一个关键词并搜索完成后，对配置文件的对应索引进行更新
def update_like_order(value):
    conf.set("default","like_max_numbers",value)
    conf.write(open('../../rule.ini', "w"))
def update_follow_order(value):
    conf.set("default","follow_max_numbers",value)
    conf.write(open('../../rule.ini', "w"))
def update_unfollow_order(value):
    conf.set("default","unfollow_max_numbers",value)
    conf.write(open('../../rule.ini', "w"))
def update_key_order(value):
    conf.set("default","key_order",value)
    conf.write(open('../../rule.ini', "w"))
def update_famous_order(value):
    conf.set("default","fans_order",value)
    conf.write(open('../../rule.ini', "w"))
def update_spot_order(value):
    conf.set("default","spot_order",value)
    conf.write(open('../../rule.ini', "w"))

#生成一个随机时间，在完成一个帖子的操作后，等待该随机时间
def random_time():
    return random.randint(time_upper_limit,time_lower_limit)

#在一行三个帖子中随机选中一个操作
def random_choice():
    return random.randint(1,3)
# -*- coding: utf-8 -*-
