import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.14
import "../S83_controls"




Rectangle
    {
    id:     rect_volume

    property int text_gain_ypos_value: 27
    property int text_volume_ypos_value: -2
    property int text_string_size: 18
    property int def_margin: 4

    height: 50
    color:  "transparent"
    radius: 5


    S83_slider_and_parametrs
        {
        id:                     slider_volume
        from:                   0
        to:                     100

        parametr_name:          "Громкость"
       // parametr_name_color_2:  Color.transparent(current_theme.color_ctrl_parametr_name, 0.7)
       // parametr_name_color_1:  Color.transparent(current_theme.color_ctrl_parametr_name, 0.7)
        parametr_value_suffix:  " %"

        parametr_name_2:        "Усиление"
        parametr_value_2:       "-"
       // parametr_value_color_2: Color.transparent(current_theme.color_ctrl_parametr_value, 0.5)
        parametr_value_suffix_2:  " дБ"



        anchors.left:           parent.left
        anchors.right:          parent.right




      //  parametr_name_color_2:  "gray"
      //  parametr_value_color_2: "gray"




        onSlider_moved:
            {
            console.log("out: Изменить громкость [1]: " + tools.round(value,10) )
            my_app.slot_send_volume(tools.round(value,1))
            }

        onSlider_moved_finish:
            {
            console.log("out: Изменить громкость [2]: " + tools.round(value,10) )
            my_app.slot_send_volume(tools.round(value,1))
            }


        }


        Connections {
                target: my_app

                function onSig_disconnected()
                    {
                    var defice = "-"
                    slider_volume.parametr_value    = defice
                    slider_volume.parametr_value_2  = defice
                    slider_volume.value = 0
                    }

                //Громкость в процентах
                function onSig_volume(arg_value)
                    {
                     console.log("in: Громкость: " + arg_value + " %")


                    if ( !slider_volume.pressed )
                        {
                        slider_volume.value = arg_value
                        slider_volume.value_label_update(arg_value)
                        }

                    if (orientation) my_toast.show("Громкость " + slider_volume.parametr_value,2500)

                    }
                //Усиление в db
                function onSig_volume_db(arg_value_db)
                    {
                    let tmp_g = tools.round(arg_value_db,10)
                    slider_volume.parametr_value_2 = tmp_g.toFixed(1)
                    slider_volume.parametr_value_2 += slider_volume.parametr_value_suffix_2
                    }

                }


    }


