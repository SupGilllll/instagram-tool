py begin
import confige
py finish
//读取最大容许点赞数
py print(confige.like_max_numbers)
echo py_result
echo `py_result`
like_max_numbers = py_result
//读取最大容许关注数
py print(confige.follow_max_numbers)
echo py_result
echo `py_result`
follow_max_numbers = py_result
//读取最大容许取关数
py print(confige.unfollow_max_numbers)
echo py_result
echo `py_result`
unfollow_max_numbers = py_result
wait 3
echo keyword.tag
tagui keyword.tag
wait 3
echo spot.tag
tagui spot.tag
wait 3
echo famous.tag
tagui famous.tag
wait 3
echo unfollow.tag
tagui unfollow.tag


