import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.12
import "../S83_controls"





S83_Slider_01
{
    id: control

    property alias  parametr_name:              pcl_top.text_label
    property alias  parametr_name_color:        pcl_top.color_label
    property alias  parametr_value:             pcl_top.text_value

    property string parametr_value_suffix:      "."


    property alias  parametr_name_2:            pcl_bottom.text_label
    property alias  parametr_name_color_2:      pcl_bottom.color_label
    property alias  parametr_value_2:           pcl_bottom.text_value
    property alias  parametr_value_color_2:     pcl_bottom.color_value

    property string parametr_value_suffix_2:    "."

    from:   0
    to:     100

    color_slider: current_theme.color_ctrl_main_color

    signal slider_moved()
    signal slider_moved_finish()


    S83_parametr_classic
        {
        id:                 pcl_top
        width:              parent.width
        anchors.top:        parent.top
        anchors.topMargin:  -10
        lr_margins:         0
        change_padding:     6
        }


    S83_parametr_classic
        {
        id:                     pcl_bottom
        width:                  parent.width
        anchors.bottom:         parent.bottom
        anchors.bottomMargin:   -6
        lr_margins:             0
        change_padding:         6
        }

    function value_label_update(arg_value)
        {
        pcl_top.text_value = tools.round(arg_value,1)
        pcl_top.text_value += parametr_value_suffix
        }

    function set_value(arg_value)
        {
        if (!control.pressed)
            {
            control.value = arg_value
            value_label_update(arg_value)
            }
        }

    property  int   ostatok:                0
    property  int   pre_ostatok:            0

    onMoved:
        {
        ostatok = control.position * 100
        ostatok %= 5
        if(ostatok === 0 && pre_ostatok != ostatok)
          {
          //slider_moved( tools.round(control.value,10) )
          slider_moved() //сигнал
          pre_ostatok = ostatok;
          return
          }
        pre_ostatok = ostatok;
        value_label_update(control.value)
        }

    //Перемещение закончено
    onPressedChanged:
        {
        if (pressed === false)
            {
            slider_moved_finish() //сигнал
            pcl_top.color_value_2 = current_theme.color_ctrl_parametr_value
            }
        else
            {
             pcl_top.color_value_2 = current_theme.color_ctrl_parametr_value_warning
            }
        }
}
