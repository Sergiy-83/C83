import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.12
import "../S83_controls"



ColumnLayout
{
    clip:       true
    spacing:    0
    S83_parametr_classic
        {
        id:             par_con_state

        Layout.fillWidth: true
        text_label:     "Состояние:"
        color_label:    "white"

        text_value:     "отключено"
        color_value:    "white"

        }

    S83_parametr_classic
        {
        id:                 par_byte_send
        text_label:         "Байт отправлено:"
        color_label:        "white"
        Layout.fillWidth:   true
        text_value:         "-"
        color_value:        "yellow"
        }

    S83_parametr_classic
        {
        id:                 par_byte_rcv
        Layout.fillWidth:   true
        text_label:         "Байт принято:"
        color_label:        "white"

        text_value:         "-"
        color_value:        "yellow"
        }

    S83_parametr_classic
    {
        id:                 par_disconnect_count
        Layout.fillWidth:   true
        text_label:         "Умышленно разорвано (раз):"
        color_label:        "white"

        text_value:         "-"
        color_value:        "yellow"

    }
    S83_parametr_classic
    {
        id:                 par_clients_count
        Layout.fillWidth:   true
        text_label:         "Клиентов подключено:"
        color_label:        "white"

        text_value:         "-"
        color_value:        "yellow"

    }
    Connections
        {
        target: my_app

    function onSig_connected()
        {
        par_con_state.text_value =     "подключено"
        par_con_state.color_value =    "green"

        }

    function onSig_connecting_start()
        {
        par_con_state.text_value =     "подключение"
        par_con_state.color_value =    current_theme.color_ctrl_parametr_value_selected

        }

    function onSig_disconnected()
        {
        par_con_state.text_value=     "отключено"
        par_con_state.color_value=    "white"
        }
      }

    //Таймер обновления некоторых значений
    Timer
        {
        id:         timer_get_trafik
        interval:   1000
        repeat:     true
        running :   true
        onTriggered:
            {
            par_byte_rcv.text_value     = my_app.slot_get_rcv_bytes()
            par_byte_send.text_value    = my_app.slot_get_send_bytes()
            par_disconnect_count.text_value = disconect_count
            par_clients_count.text_value = client_count
            }
        }



}
