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
wait 5

click //*[@id="react-root"]/section/main/div/header/section/ul/li[2]
wait 1
number=0

for fan from 1 to infinity
{
if !present('/html/body/div[4]/div/div/div[2]/ul/div/li['+fan+']/div/div[3]')
break

click /html/body/div[4]/div/div/div[2]/ul/div/li['+fan+']/div/div[3]

wait 2

if present('/html/body/div[5]/div/div/div/div[2]/button[2]')
    click /html/body/div[5]/div/div/div/div[2]/button[2]
    wait 2
}
py begin
import tagCsv
import confige
order=order+1
print(str(order))
confige.update_famous_order(str(order))
py finish
echo py_result
echo `py_result`
wait 5
click /html/body/div[1]/section/nav/div[2]/div/div/div[3]/div/div[1]/div/a
}
