https://www.instagram.com/

py begin
import tagCsv
import judge_all
import confige
import mail
py finish

py begin
headers = ['state']
row = {'state':'false'}
tagCsv.entered_judge_begin_writeCsv(headers,row)
py finish

//读取用户名
py print(confige.username)
echo py_result
echo `py_result`
username = py_result

//读取密码
py print(confige.password)
echo py_result
echo `py_result`
pass_word = py_result

//读取检索页数
py print(confige.pages)
echo py_result
echo `py_result`
pages = py_result

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
py print(len(confige.key_word))
echo py_result
echo `py_result`
key_numbers = py_result

//读取当前关键词位置
py order = int(confige.key_order)
echo py_result
echo `py_result`

wait 10
for n from 1 to key_numbers
{
if like_max_numbers==0
{
if follow_max_numbers==0
break
}
py begin
if order>=len(confige.key_word):
    order=0
print(confige.key_word[order])
py finish
echo py_result
echo `py_result`
keyword = py_result

//输入关键词
type //*[@id="react-root"]/section/nav/div[2]/div/div/div[2]/input as [clear]`keyword`[enter]
wait 3
click //*[@id="react-root"]/section/nav/div[2]/div/div/div[2]/div[3]/div[2]/div/a[1]
wait 3

//对帖子执行操作
row1_numbers = pages*8
column1_numbers = 3

for row1 from 1 to row1_numbers
{
if like_max_numbers==0
{
if follow_max_numbers==0
break
}
if row1<=11
{
hover //*[@id="react-root"]/section/main/article/div[2]/div/div['+row1+']
}
else
{
if row1%2==1
{
hover //*[@id="react-root"]/section/main/article/div[2]/div/div[12]
}
}
wait 5
for column1  from 1 to column1_numbers
{
if like_max_numbers==0
{
if follow_max_numbers==0
break
}
py print(str(confige.random_choice()))
echo py_result
echo `py_result`
choice=py_result
if choice%3==0
{
//逐个点开帖子
if row1<=11
{
if row1==11
{
click  //*[@id="react-root"]/section/main/article/div[2]/div/div[10]/div['+column1+']/a/div
}
else
{
click  //*[@id="react-root"]/section/main/article/div[2]/div/div['+row1+']/div['+column1+']/a/div
}
}
else
{
if row1%2==0
{
click  //*[@id="react-root"]/section/main/article/div[2]/div/div[11]/div['+column1+']/a/div
}
if row1%2==1
{
click  //*[@id="react-root"]/section/main/article/div[2]/div/div[10]/div['+column1+']/a/div
}
}
wait 3
if present('/html/body/div[4]/div[2]/div/article/div[3]/section[1]/span[1]/button')
{
//点赞
dom return document.querySelector('[aria-label="Like"]').getAttribute("aria-label")
echo `dom_result`
label=dom_result
if label=="Like"
{
if like_max_numbers>0
{
like_max_numbers=like_max_numbers-1
py print(str(confige.random_time()))
echo py_result
echo `py_result`
wait_time = py_result
wait `wait_time`
click /html/body/div[4]/div[2]/div/article/div[3]/section[1]/span[1]/button
wait 3
if present('/html/body/div[5]/div/div/div/div[2]/button[2]')
{
click /html/body/div[5]/div/div/div/div[2]/button[2]
py begin
mail.send_mail('account lock')
py finish
py begin
import over
py finish
}
else
{
//对点赞用户的id进行记录并存储在log文件夹中
read /html/body/div[4]/div[2]/div/article/header/div[2]/div[1]/div[1]/span/a to id
//读取时间
js begin
function formatDate(date) {
    var d = new Date(date),
        mm = '' + (d.getMonth() + 1),
        dd = '' + d.getDate(),
        yy = d.getFullYear(),
        hh = '' + d.getHours(),
        min = '' + d.getMinutes();
    return [yy.toString(), (mm>9?'':'0')+mm, (dd>9?'':'0')+dd].join('-') + "_"+ (hh>9?'':'0')+hh+':'+(min>9?'':'0')+min;
}
now = formatDate(new Date());
js finish
echo `now`
echo `keyword`
py_step('id = "' + id + '"')
py_step('now = "' + now + '"')
py_step('keyword = "' + keyword + '"')
py begin
headers = ['keyword','id','now']
row = {
       'keyword':keyword,
       'id':id,
       'now':now
       }
tagCsv.entered_keyword_writeCsv(headers,row)
py finish
}
}
}
//点击关注
read /html/body/div[4]/div[2]/div/article/header/div[2]/div[1]/div[2]/button to follow_state
if follow_state=="Follow"
{
read /html/body/div[4]/div[2]/div/article/header/div[2]/div[1]/div[1]/span/a to id
py_step('id = "' + id + '"')
py begin
print(judge_all.check_follow(id))
py finish
echo py_result
echo `py_result`
if py_result=="not_exist"
{
if follow_max_numbers>0
{
follow_max_numbers=follow_max_numbers-1
py print(str(confige.random_time()))
echo py_result
echo `py_result`
wait_time = py_result
wait `wait_time`
click /html/body/div[4]/div[2]/div/article/header/div[2]/div[1]/div[2]/button
wait 3
if present('/html/body/div[5]/div/div/div/div[2]/button[2]')
{
click /html/body/div[5]/div/div/div/div[2]/button[2]
py begin
mail.send_mail('account lock')
py finish
py begin
import over
py finish
}
else
{
//将关注用户的id进行记录并存储在log文件夹中
read /html/body/div[4]/div[2]/div/article/header/div[2]/div[1]/div[1]/span/a to id
py_step('id = "' + id + '"')
py begin
headers = ['id']
row = {'id':id}
tagCsv.entered_followed_three_writeCsv(headers,row)
tagCsv.entered_followed_all_writeCsv(headers,row)
py finish
}
}
}
}
}
click /html/body/div[4]/div[3]/button/div
}
}
}
//读取下一个关键词，重复之前的操作
py begin
order=order+1
print(str(order))
confige.update_key_order(str(order))
py finish
echo py_result
echo `py_result`
wait 5
click //*[@id="react-root"]/section/nav/div[2]/div/div/div[2]/div/div
}

py begin
headers = ['state']
row = ['true']
tagCsv.entered_judge_writeCsv(headers,row)
py finish