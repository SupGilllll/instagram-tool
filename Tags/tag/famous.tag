https://www.instagram.com/

//读取用户名
py begin
import tagCsv
import confige
import judge_all
import mail
print(confige.username)
py finish
echo py_result
echo `py_result`
username = py_result

py begin
headers = ['state']
row = ['false']
tagCsv.entered_judge_writeCsv(headers,row)
py finish

//读取密码
py print(confige.password)
echo py_result
echo `py_result`
pass_word = py_result

//登录
wait 3
if present('//*[@id="react-root"]/section/nav/div[2]/div/div/div[3]/div/div[5]/span/img')
{
click //*[@id="react-root"]/section/nav/div[2]/div/div/div[3]/div/div[5]/span/img
click //*[@id="react-root"]/section/nav/div[2]/div/div/div[3]/div/div[5]/div[2]/div/div[2]/div[2]/div/div
}
type //*[@id="loginForm"]/div/div[1]/div/label/input as `username`
type //*[@id="loginForm"]/div/div[2]/div/label/input as `pass_word`
click //*[@id="loginForm"]/div/div[3]
wait 3

//判断是是否有弹窗
if  present('//*[@id="react-root"]/section/main/div/div/div/div/button')   
    click //*[@id="react-root"]/section/main/div/div/div/div/button
wait 3
click //*[@id="react-root"]/section/nav/div[2]/div/div/div[2]/div/div

//循环读取关键词
py print(len(confige.famous_person))
echo py_result
echo `py_result`
key_numbers = py_result

//读取当前关键词位置
py order = int(confige.famous_order)
echo py_result
echo `py_result`

for n from 1 to key_numbers
{
//判断是否到达一天最大关注数
if follow_max_numbers==0
{
break
}
py begin
if order>=len(confige.famous_person):
    order=0
print(confige.famous_person[order])
py finish
echo py_result
echo `py_result`
keyword = py_result

//输入关键词
type //*[@id="react-root"]/section/nav/div[2]/div/div/div[2]/input as [clear]`keyword`[enter]
wait 3
click //*[@id="react-root"]/section/nav/div[2]/div/div/div[2]/div[3]/div[2]/div/a[1]
wait 3

click //*[@id="react-root"]/section/main/div/header/section/ul/li[2]
wait 3
number=0
for fan from 1 to infinity
{
if follow_max_numbers==0
{
break
}
//判断是否要关注该用户
if present('/html/body/div[4]/div/div/div[2]/ul/div/li['+fan+']/div/div[3]')
{
read /html/body/div[4]/div/div/div[2]/ul/div/li['+fan+']/div/div[3] to follow_state
}
//if present('/html/body/div[4]/div/div/div[2]/ul/div/li['+fan+']/div/div[2]')
//{
//read /html/body/div[4]/div/div/div[2]/ul/div/li['+fan+']/div/div[2] to follow_state
//}
echo `follow_state`
wait 3
if follow_state=="Follow"
{
if present('/html/body/div[4]/div/div/div[2]/ul/div/li['+fan+']/div/div[2]/div[1]')
{
read /html/body/div[4]/div/div/div[2]/ul/div/li['+fan+']/div/div[2]/div[1] to id
}
if present('/html/body/div[4]/div/div/div[2]/ul/div/li['+fan+']/div/div[1]/div[2]/div[1]')
{
read /html/body/div[4]/div/div/div[2]/ul/div/li['+fan+']/div/div[1]/div[2]/div[1] to id
}
py_step('id = "' + id + '"')
py begin
print(judge_all.check_follow(id))
py finish
echo py_result
echo `py_result`
//如果是未关注的用户，就关注
if py_result=="not_exist"
{
if follow_max_numbers>0
{
follow_max_numbers=follow_max_numbers-1
if !present('/html/body/div[4]/div/div/div[2]/ul/div/li['+fan+']/div/div[3]')
{
click /html/body/div[4]/div/div/div[2]/ul/div/li['+fan+']/div/div[2]
}
else
{
click /html/body/div[4]/div/div/div[2]/ul/div/li['+fan+']/div/div[3]
}
py print(str(confige.random_time()))
echo py_result
echo `py_result`
wait_time = py_result
wait `wait_time`
read /html/body/div[4]/div/div/div[2]/ul/div/li['+fan+']/div/div[3] to follow_state
echo `follow_state`
//将关注用户的id进行记录并存储在log文件夹中
if follow_state!="Follow"
{
py begin
headers = ['id']
row = {'id':id}
tagCsv.entered_followed_three_writeCsv(headers,row)
tagCsv.entered_followed_all_writeCsv(headers,row)
py finish
}
else
{
py begin
mail.send_mail('account lock')
py finish
py begin
import over
py finish
}
}
}
} 
hover /html/body/div[4]/div/div/div[2]/ul/div/li['+fan+']
wait 3
}
//读取下一个关键词，重复之前的操作
py begin
order=order+1
print(str(order))
confige.update_famous_order(str(order))
py finish
echo py_result
echo `py_result`
click /html/body/div[1]/section/nav/div[2]/div/div/div[3]/div/div[1]/div/a
wait 3
}

py begin
headers = ['state']
row = ['true']
tagCsv.entered_judge_writeCsv(headers,row)
py finish