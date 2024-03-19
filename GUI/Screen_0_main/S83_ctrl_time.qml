import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.12
import "../S83_controls"

Rectangle
{
    width:          100 // parent.width
    height:         50
    color:          "transparent"
    radius: 5

    property int    def_margin: 4
    property alias  slider_value: slider_time.value

    signal          moved_end();

    property int    time_current: 0
    property int    time_duration: 0

    function convert_time(arg_time_sec)
        {
        var tmp_time = "";

               let tmps,h,m,s;

                if (arg_time_sec < 0) arg_time_sec = 0;

                tmps = arg_time_sec % 3600;
                h = Math.floor(arg_time_sec / 3600);
                m = Math.floor(tmps/60);
                s= tmps % 60;

                if (h)
                        {
                        if(h > 99) h=99;
                        tmp_time = h;
                        tmp_time += ':';
                        }

                if (m || (h!=0) )
                        {
                        if (h)
                            {
                            if (m<10) tmp_time += "0";
                            tmp_time += m;
                            }
                        else tmp_time = m;

                        tmp_time += ':';
                        }

                if (!h && !m)
                        {
                        tmp_time = s;
                        }
                else
                        {
                        if (s<10) tmp_time += "0";
                        tmp_time += s;
                        }

                return tmp_time;
        }






    S83_Slider_01
        {
        id:     slider_time
        width:  parent.width
        height: 40

        from:   0
        value:  1
        to:     100

        color_slider: current_theme.color_ctrl_main_color
        y: 6

        property real tmp_sec: 0
        property bool flag_propusk: false

        onPressedChanged:
            {
            if (pressed === false) //Отпустили
                {
                my_app.slot_seek_sec(Math.floor(tmp_sec))
                console.log("Позиционирование: " + Math.floor(tmp_sec) + " sec, [" + Math.floor(value) + " %]")//moved_end()
                text_time_value.color = current_theme.color_ctrl_parametr_value
                }
            else //Нажали
                {
                text_time_value.color = current_theme.color_ctrl_parametr_value_warning
                flag_propusk = true
                onMoved()
                }
            }

        onMoved:
            {
            tmp_sec = value * time_duration / 100;
            text_time_value.text = convert_time(Math.floor(tmp_sec));
            text_time_value.text += " / "
            text_time_value.text += convert_time(time_duration);
            }
        }

    property    int text_time_ypos:     -2
    property    int text_time_pos_ypos: 26
    property    int text_string_size:   18

    Text
        {
        id: text_time
        x:5
        y:      text_time_ypos
        text:   "Время"
        color:  current_theme.color_ctrl_parametr_name
        font.pixelSize: text_string_size
        }
    Text
        {
        id:     text_time_value
        y:      text_time_ypos
        text:   "0/0"
        color:  current_theme.color_ctrl_parametr_value
        font.pixelSize: text_string_size
        anchors.right: parent.right
        anchors.rightMargin: 7
        }



    Text
        {
        id:     text_time_pos
        x:      5
        y:      text_time_pos_ypos
        text:   "Позиция"
        color:  current_theme.color_ctrl_parametr_name

        font.pixelSize: text_string_size
        }

    Text
        {
        id:     text_time_pos_value
        y:      text_time_pos_ypos
        text:   "100 %"
        color:  current_theme.color_ctrl_parametr_value

        font.pixelSize:         text_string_size
        anchors.right:          parent.right
        anchors.rightMargin:    7
        }

    Connections
        {
            target: my_app

            function onSig_disconnected()
                {
                var defice = "-"
                text_time_pos_value.text = defice
                text_time_value.text = defice
                slider_time.value = 0
                }

            function onSig_time_current(arg_time)
                {
                timer_no_rcv_command.restart_timer();

                time_current = arg_time

                if (slider_time.flag_propusk)
                    {
                    slider_time.flag_propusk = false
                    return
                    }

                if (!slider_time.pressed)
                    {
                    text_time_value.text =  convert_time(arg_time)
                    text_time_value.text += " / "
                    text_time_value.text += convert_time(time_duration)

                    if (time_duration < 1 )
                        {
                        slider_time.value = 0
                        }
                    else
                        {
                        slider_time.value = arg_time * 100 /  time_duration

                        }

                    text_time_pos_value.text = Math.floor(slider_time.value)
                    text_time_pos_value.text += " %"
                    }
                }

            function onSig_time_duration(arg_time)
                {
                time_duration = arg_time
                }
        }

}
