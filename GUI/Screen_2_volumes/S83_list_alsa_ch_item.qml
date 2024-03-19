import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.12
import "../S83_controls"

Rectangle
{
    width:  list_alsa_ch.width - 6

    height:             list_alsa_ch.height_item
    anchors.leftMargin: 5
    color:              "transparent"// i_cardRole ? current_theme.color_ctrl_selected : "transparent"
    border.color:       "transparent"



    property int text_list_item_string_size: 18
    property int def_margin: 5
    property int text_y_correction:-2

    //Имя канала
    S83_RadioButton
            {
            id:                     rb_alsa_ch_name
            width:                  100
            height:                 38
            anchors.right:          parent.right
            anchors.left:           parent.left

            anchors.leftMargin:     5
            anchors.rightMargin:    5
            text:                   nameChannelRole


            font.pixelSize:         text_list_item_string_size
            checked:                index === list_alsa_ch.currentIndex     //Выделим если номера совподают
            anchors.verticalCenter: parent.verticalCenter
             //elide:  Text.ElideRight  //Сокращение точками



            onCheckedChanged:
                {

                if (checked)
                    {
                    //console.log("event: Изменился cheked делегата. Индекс - " + index)
                    list_alsa_ch.currentIndex = index
                    }
                }



            }

            MouseArea
                {
                anchors.fill: parent
                onClicked:
                    {
                    my_app.slot_click_on_alsa_ch(index)
                    console.log("out: Выбрать канал ALSA: №" + index)
                    }
            }


}
