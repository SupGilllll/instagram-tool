# coding:utf-8
import configparser

conf = configparser.ConfigParser()

conf.read("../../rule.ini", encoding="utf-8")

username = conf.get("default","username")
password = conf.get("default","password")

spot  = conf['default']['spot']
spot  = spot.split(',')

key_word = conf['default']['keyword']
key_word = key_word.split(',')

famous_person = conf['default']['famous_person']
famous_person = famous_person.split(',')

key_order=conf.get("default","key_order")
famous_order=conf.get("default","fans_order")
spot_order=conf.get("default","spot_order")

model = conf.get("default","model")

def update_key_order(value):
    conf.set("default","key_order",value)
    conf.write(open('../../rule.ini', "w"))
def update_famous_order(value):
    conf.set("default","fans_order",value)
    conf.write(open('../../rule.ini', "w"))
def update_spot_order(value):
    conf.set("default","spot_order",value)
    conf.write(open('../../rule.ini', "w"))