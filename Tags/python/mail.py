#!/usr/bin/python
# -*- coding: UTF-8 -*-
 
import configparser
import smtplib
import socket
import datetime
from email.mime.text import MIMEText
from email.header import Header

conf = configparser.ConfigParser()

conf.read("../../rule.ini", encoding="utf-8")
def  send_mail(type):
    # 获取当前时间
    datetime.datetime.now()
    time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

    # 获取计算机信息
    def func( ):
        s = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
        s.connect(('8.8.8.8',80))
        ip = s.getsockname( )[0]
        return ip
    mail_body=func( )
    
    html ="send_info:"+"    "+ "IP:"+mail_body+"    "+"TYPE:"+type+"    "+"TIME:"+time
    

    # 第三方 SMTP 服务
    mail_host = conf.get("default","mail_host")
    mail_user = conf.get("default","mail_user")
    mail_pass = conf.get("default","mail_pass")
    sender = conf.get("default","sender")
    receivers = conf.get("default","receivers")
    port = conf.get("default","port")
    subject_content = conf.get("default","subject_content")

    message =MIMEText(html, 'html', 'utf-8')
    message['From'] = Header("send from", 'utf-8')
    message['To'] =  Header("send to", 'utf-8')
    subject = subject_content+mail_body
    message['Subject'] = Header(subject,  'utf-8')
 
 
    try:
        smtpObj = smtplib.SMTP(host=mail_host ) 
        smtpObj.connect(mail_host, port)    # 25 为 SMTP 端口号
        smtpObj.ehlo()
        smtpObj.starttls()
        smtpObj.login(mail_user,mail_pass)  
        smtpObj.sendmail(sender, receivers, message.as_string())
        print("邮件发送成功")
    except Exception as err:
        print("邮件发送失败")
        print(err)
