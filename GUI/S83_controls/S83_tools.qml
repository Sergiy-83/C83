import QtQuick 2.0

Item
{
function round(x,y)
    {
    return Math.round(x * y) / y
    }



function krat(x,y)
    {
    return Math.round(x / y)* y
    }

function add_zero(arg_value)
    {
    if (arg_value % 1)
        return ".0"
    return ""
    }
//#define ROUND(x,y) (float)((int)((x + 5/(float)(y*10)) * y))/y

}
