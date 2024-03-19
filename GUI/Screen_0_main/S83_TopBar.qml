import QtQuick 2.15
import QtQuick.Window 2.15
import "../S83_controls"


Rectangle
    {
    property int def_margin: 5

    id:         topBar
    visible:    true
    width:      100
    height:     40
    color:      current_theme.color_ctrl_background
    radius:     5



    anchors.rightMargin:    def_margin
    anchors.leftMargin:     def_margin - 1
    anchors.topMargin:      def_margin



    Text
    {
        id: textAppState
        text: " "
        color: "#ffffff"
        font.pixelSize: 18

        anchors.left:           parent.left
        anchors.right:          parent.right
        anchors.leftMargin:     8
        anchors.rightMargin:    40//def_margin
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -2
        elide: Text.ElideRight
        //wrapMode: "WordWrap"

    }



    Connections
        {
        target: my_app

        function onSig_status_label(arg_text,arg_color)
                {
                textAppState.text   = arg_text
                textAppState.color  = arg_color
                }
        }

}
