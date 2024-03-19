import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.12

Item
{
    id: control
    property alias  text_label:     label.text
    property alias  text_value:     value.text
    property string color_label:    "white"
    property string color_value:    "yellow"

    property alias  text_value_1:   label.text
    property alias  text_value_2:   value.text
    property alias  color_value_1:  control.color_label
    property alias  color_value_2:  control.color_value

    property int lr_margins: 2
    property int change_padding: 10


    height: label.height
    implicitWidth: 150
    //width: 150
    Text
        {
        id:                 label
        padding:            change_padding

        anchors.left:       parent.left
        anchors.top:        parent.top
        anchors.leftMargin: lr_margins

        text:               "100"
        color:              control.enabled ? color_label : "dimgray"
        font.pixelSize:     18

        }

    Text
        {
        id:                     value
        padding:                change_padding

        anchors.left:           label.right
        anchors.right:          parent.right
        anchors.top:            parent.top
        anchors.rightMargin:    lr_margins


        horizontalAlignment:    Text.AlignRight
        elide:                  Text.ElideLeft  //Сокращение точками

        text:                   "100"
        color:                  control.enabled ? color_value : "dimgray"
        font.pixelSize:         18
        }


}
