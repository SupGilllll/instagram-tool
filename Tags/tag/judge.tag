py begin
import tagCsv
import mail
py finish
py print(tagCsv.put_judge_readCsv())
echo py_result
echo `py_result`
column = py_result
right="['state', 'false', 'true', 'false', 'true', 'false', 'true', 'false', 'true']"
if  column==right
{
echo success
}
else
{
py begin
mail.send_mail('abnormal termination')
py finish
}

