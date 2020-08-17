py begin
import confige
print(confige.model)
py finish
echo py_result
echo `py_result`
model = py_result
if model=="1"
{
tagui spot.tag
}
if model=="2"
{
tagui keyword.tag
}
if model=="3"
{
tagui famous.tag
}
