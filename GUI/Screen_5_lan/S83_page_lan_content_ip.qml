import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.12
import "../S83_controls"



ColumnLayout
{
    clip:       true
    spacing:    0

    Item
    {
        Layout.fillWidth: true
        height:  40 //par_con_state.height
        Text
        {
            id:         text_ip
            padding:    10
            anchors.left: parent.left

            //anchors.horizontalCenter: parent.horizontalCenter
            text:       "IP адрес сервера:"
            color:      "white"
            font.pixelSize: 18
        }



        S83_TextField
            {
            property string pre_ok_ip: "-"

            id:                     ip_addres_in

            anchors.right:          parent.right
            anchors.rightMargin:    activeFocus ? 10 : 2

            y:                      text_ip.y + 5

            selectByMouse:          true
            text:                   "192.168.0.84"
            padding:                10

            color: activeFocus ?   focus ? current_theme.color_ctrl_parametr_value_selected : current_theme.color_ctrl_parametr_value            :              focus && (pre_ok_ip !== text)? current_theme.color_ctrl_parametr_value_warning : current_theme.color_ctrl_parametr_value

            //inputMethodHints:       Qt.ImhDigitsOnly
            inputMethodHints:       Qt.platform.os === "android" ? Qt.ImhDigitsOnly : Qt.ImhNone
            //inputMethodHints:       Qt.ImhImhNone

            validator: S83_RegExpValidator
                        {
                        regExp:  /^((?:[0-1]?[0-9]?[0-9]|2[0-4][0-9]|25[0-5])\.){0,3}(?:[0-1]?[0-9]?[0-9]|2[0-4][0-9]|25[0-5])$/

                        }

            onAccepted:
                {
                ip_start()
                stack_view.pop(page_main)
                }

            }



    }
    function show_no_cor_ip()
        {
        my_toast.show("Некорректный IP адрес",3000)
        }
    function ip_start()
        {
        ip_addres_in.focus = false

        var dotCount = 0;
        for (var i = 0; i < ip_addres_in.text.length; i++)
            {
                 if (ip_addres_in.text[i] === ".")
                     dotCount++;
            }

        if  (dotCount === 3)
            {
            if (ip_addres_in.text[ip_addres_in.text.length-1] === ".")
                {ip_addres_in.text += "0"
                show_no_cor_ip()
                }
            }

        if  (dotCount === 2)
            {
            if (ip_addres_in.text[ip_addres_in.text.length-1] === ".")
                ip_addres_in.text += "0"

            ip_addres_in.text += ".0"
            show_no_cor_ip()
            }

        if  (dotCount === 1)
            {
            if (ip_addres_in.text[ip_addres_in.text.length-1] === ".")
                ip_addres_in.text += "0"

            ip_addres_in.text += ".0.0"
            show_no_cor_ip()
            }

        if  (dotCount === 0 && ip_addres_in.length)
            {
            ip_addres_in.text = "192.168.0.84"
            show_no_cor_ip()
            }

        if (ip_addres_in.text === "")
            {
            ip_addres_in.text = "192.168.0.84"
            show_no_cor_ip()
            }

        ip_addres_in.pre_ok_ip = ip_addres_in.text
        console.log("Изменение IP адреса: " + ip_addres_in.text)
        my_app.slot_ip_address_change(ip_addres_in.text)
        }

    S83_Button
        {
        id:                 btn_connect
        text:               "Соединить"
        enabled:            true
        width:              200
        height:             50
        y:                  10

        Layout.alignment:   Qt.AlignBottom
        Layout.fillWidth:   true

        Layout.leftMargin:      10
        Layout.rightMargin:     10
        Layout.topMargin:       2
        Layout.bottomMargin:    5

        btn_color:          current_theme.color_ctrl_main_color
        onClicked:
            {
            ip_start()
            }
        }

    function ip_to_4(arg_ip)
        {
        ip_addres_in.text = arg_ip
        ip_addres_in.pre_ok_ip = arg_ip
        }

    Connections
            {
            target: my_app

            function onSig_ipaddress(arg_ip)
                {
                ip_to_4(arg_ip)
                }

            }
}
