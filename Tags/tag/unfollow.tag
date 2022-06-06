https://www.instagram.com/

//读取用户名
py begin
import tagCsv
import confige
import judge_three
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


//进入个人主页
click //*[@id="react-root"]/section/nav/div[2]/div/div/div[3]/div/div[5]
wait 3
click /html/body/div[1]/section/nav/div[2]/div/div/div[3]/div/div[5]/div[2]/div/div[2]/div[2]/a[1]/div

read //*[@id="react-root"]/section/main/div/header/section/ul/li[3]/a/span to numbers
if numbers>unfollow_max_numbers
numbers=unfollow_max_numbers
wait 3
click //*[@id="react-root"]/section/main/div/header/section/ul/li[3]/a
temp=0
for n from 1 to numbers
{
if unfollow_max_numbers==0
{
break
}
//周期下拉滑块
if temp==6
{
temp=0
if present('/html/body/div[4]/div/div/div[2]/div')
{
click /html/body/div[4]/div/div/div[2]/div
}
}
wait 3
if present('/html/body/div[4]/div/div/div[2]/ul/div/li['+n+']/div/div[1]/div[2]/div[1]')
{
read /html/body/div[4]/div/div/div[2]/ul/div/li['+n+']/div/div[1]/div[2]/div[1] to id
}
if present('/html/body/div[4]/div/div/div[2]/ul/div/li['+n+']/div/div[2]/div[1]')
{
read /html/body/div[4]/div/div/div[2]/ul/div/li['+n+']/div/div[2]/div[1] to id
}
py_step('id = "' + id + '"')
py begin
print(judge_three.check_follow(id))
py finish
echo py_result
echo `py_result`
//如果该用户存在于三天内的关注记录中，就对其取消关注
if py_result=="exist"
{
if unfollow_max_numbers>0
{
unfollow_max_numbers=unfollow_max_numbers-1
if !present('/html/body/div[4]/div/div/div[2]/ul/div/li['+n+']/div/div[3]/button')
{
click /html/body/div[4]/div/div/div[2]/ul/div/li['+n+']/div/div[2]/button
}
if present('/html/body/div[4]/div/div/div[2]/ul/div/li['+n+']/div/div[3]/button')
{
click /html/body/div[4]/div/div/div[2]/ul/div/li['+n+']/div/div[3]/button
}
wait 3
click /html/body/div[5]/div/div/div/div[3]/button[1]
}
}
hover /html/body/div[4]/div/div/div[2]/ul/div/li['+n+']
temp=temp+1
py print(str(confige.random_time()))
echo py_result
echo `py_result`
wait_time = py_result
wait `wait_time`
}
click /html/body/div[4]/div/div/div[1]/div/div[2]/button

py begin
headers = ['state']
row = ['true']
tagCsv.entered_judge_writeCsv(headers,row)
py finish