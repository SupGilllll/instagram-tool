https://www.instagram.com/

//读取用户名
py begin
import tagCsv
import confige
print(confige.username)
py finish
echo py_result
echo `py_result`
username = py_result

//读取密码
py print(confige.password)
echo py_result
echo `py_result`
pass_word = py_result

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
wait 2
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

for n from 1 to key_numbers
{
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
wait 5

//对最热帖子执行操作
row1_numbers = count('//*[@id="react-root"]/section/main/article/div[2]/div/div')
column1_numbers = 3

for row1 from 1 to row1_numbers
{
for column1  from 1 to column1_numbers
{
//逐个点开热点帖子
click  //*[@id="react-root"]/section/main/article/div[2]/div/div['+row1+']/div['+column1+']/a/div
wait 3

//点赞
dom return document.querySelector('[aria-label="Like"]').getAttribute("aria-label")
echo `dom_result`
wait 3
label=dom_result
if label=="Like"
click /html/body/div[4]/div[2]/div/article/div[3]/section[1]/span[1]/button
wait 3

//记录关键词，发布者ID，时间
read /html/body/div[4]/div[2]/div/article/header/div[2]/div[1]/div[1]/span/a to id
echo `now`
echo `keyword`
py_step('id = "' + id + '"')
py_step('now = "' + now + '"')
py_step('keyword = "' + keyword + '"')
py begin
import tagCsv
import confige
headers = ['keyword','id','now']
row = {
       'keyword':keyword,
       'id':id,
       'now':now
       }
tagCsv.entered_keyword_writeCsv(headers,row)
py finish
//点击关注
click /html/body/div[4]/div[2]/div/article/header/div[2]/div[1]/div[2]/button
wait 2
//判断是否弹出取消关注
if  present('/html/body/div[5]/div/div/div/div[3]/button[2]')   
    click /html/body/div[5]/div/div/div/div[3]/button[2]
    wait 1

click /html/body/div[4]/div[3]/button/div
wait 1
}
}
py begin
import tagCsv
import confige
order=order+1
print(str(order))
confige.update_key_order(str(order))
py finish
echo py_result
echo `py_result`
wait 5
click //*[@id="react-root"]/section/nav/div[2]/div/div/div[2]/div/div
}