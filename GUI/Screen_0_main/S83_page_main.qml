import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.12
import "../S83_controls"
import "../Screen_1_main_option"
import "../Drawer"

Page
    {

    Item
        {
        id: orient
        property bool value: orientation
        onValueChanged:
            {
            console.log("Изменилась ориентация: " + value)
            if (value) //Пейзаж
                {
                cl_main_controls.visible    = false
                ctrl_time.anchors.bottom    = cl_main_controls.bottom

                rect_bk_ctrl.anchors.right  = rect_buttons_2.left
                rect_bk_ctrl.height         = ctrl_time.height + 5

                rect_buttons_2.visible      = true
                rect_buttons_2.anchors.top  = parent.top

                listView.anchors.right      = rect_buttons_2.left

                topBar.anchors.right        = rect_buttons_2.left
                }
            else //Портрет
                {
                cl_main_controls.visible    = true

                ctrl_time.anchors.bottom    = cl_main_controls.top

                rect_bk_ctrl.anchors.right  = parent.right
                rect_bk_ctrl.height         = cl_main_controls.height + ctrl_time.height + 5

                listView.anchors.right      = parent.right
                rect_buttons_2.visible      = false

                topBar.anchors.right        = parent.right
                }
            }
        }

    //Фон
    background: Rectangle
        {
        anchors.fill:   parent
        color:          "black"
        }

    //Сверху///////////////////////////////////////////////////////////////////
    S83_TopBar
        {
        id: topBar
        anchors.left:   parent.left
        anchors.right:  parent.right
        anchors.top:    parent.top
        x:  0
        y:  0
        }

    //Список файлов////////////////////////////////////////////////////////////
    S83_list_wiev
        {
        id:         listView
        visible:    state_conected //Если нет соединения то не отображаем

        //Растяжка
        anchors.left:   parent.left
        anchors.right:  parent.right
        anchors.top:    topBar.bottom
        anchors.bottom: rect_bk_ctrl.top

        Image
            {
            id:         image_bk_list
            width:      48
            height:     48

            anchors.right:          parent.right
            anchors.bottom:         parent.bottom
            anchors.rightMargin:    2






            // Анимация Появления
            Behavior on visible
                {
                NumberAnimation
                    {
                    target: image_bk_list
                    property: "opacity"
                    from:   0
                    to:     1
                    duration: 200 // длительность анимации в миллисекундах
                    }
                }

            source:  "qrc:/Icon/for_file_list/bk_list_no_play.svg"
            MouseArea
                {
                anchors.fill:   parent
                onClicked:      my_app.slot_open_bk_list()
                }
            }
        }


    //Затемнялка 1 - соединение не установлено
    Rectangle
        {
        visible:        !state_conected

        color:          "#aa000000"
        anchors.top:    topBar.bottom
        anchors.bottom: parent.bottom
        anchors.left:   parent.left
        anchors.right:  parent.right
        z:+1
        MouseArea { anchors.fill: parent }
        }

    //Затемнялка 2
    S83_block_screen
        {
        visible:        state_conected && state_no_responce
        image_src:      "qrc:/Icon/for_page/no_server_data.svg"
        message_src:    "Сервер не отвечает."
        content_y_offset: -25
        anchors.top:    topBar.bottom
        anchors.bottom: parent.bottom
        }


    //Кнопки для пейзажной ориентации
    Rectangle
        {
        id:                     rect_buttons_2
        height:                 100
        width:                  parent.width * 0.1
        radius:                 5
        z:                      +1

        anchors.top:            topBar.bottom
        anchors.bottom:         parent.bottom
        anchors.right:          parent.right

        anchors.rightMargin:    5
        anchors.topMargin:      5
        anchors.bottomMargin:   5
        visible:                false

        color:                  current_theme.color_ctrl_background

        S83_ctrl_sec_buttons_layout
            {
            anchors.fill: parent
            }

        //Затемнялка 3 - соединение не установлено
        Rectangle
            {
            visible:        !state_conected || state_no_responce
            color:          "#aa000000"
            anchors.fill:   parent
            z:+1
            MouseArea { anchors.fill: parent }
            }
        }

    //управление для портретной ор.
    Rectangle
                {
                id:             rect_bk_ctrl
                radius:         5
                z:              -1

                color:          current_theme.color_ctrl_background
                height:         cl_main_controls.height + ctrl_time.height + 5

                anchors.bottom: parent.bottom
                anchors.left:   parent.left
                anchors.right:  parent.right

                anchors.rightMargin:    5
                anchors.leftMargin:     5
                anchors.topMargin:      5
                anchors.bottomMargin:   5

                //Перемотка
                S83_ctrl_time
                    {
                    id: ctrl_time
                    //Layout.alignment: Qt.AlignBottom
                    //Layout.fillWidth: true


                    anchors.bottom: cl_main_controls.top
                    anchors.left:   parent.left
                    anchors.right:  parent.right

                    onMoved_end:
                        {
                        //console.log("slider_value - " + slider_value)
                        }
                    }

                ColumnLayout
                           {
                           id:              cl_main_controls
                           anchors.left:    parent.left
                           anchors.right:   parent.right
                           anchors.bottom:  parent.bottom
                           anchors.bottomMargin:    3


                           clip:            true

                           spacing:         0




                           //Кнопки
                           S83_ctrl_main_buttons_layout
                               {
                               id: ctrl_btn
                               Layout.alignment: Qt.AlignBottom
                               }

                           //Регулятор громкости
                           S83_ctrl_volume
                               {
                               id: ctrl_vol
                               Layout.alignment: Qt.AlignBottom
                               Layout.fillWidth: true
                               }

                           }
                }

    ///////////////////////////////////////////////////////////////////
    S83_BusyIndicator
        {
        id:                 bus_ind
        anchors.centerIn:   listView
        running:            !state_conected
        }

    S83_hamburger_icon
        {
        id: hamburger_icon

        anchors.right:          topBar.right
        anchors.verticalCenter: topBar.verticalCenter
        anchors.rightMargin:     3

        //anchors.verticalCenterOffset: 3
        onIconClicked:
            {
            if (icon_state === "back")
                drawer.open()

            if (icon_state === "menu")
                drawer.close()
            }
        }

    //Боковое меню
    S83_drawer
        {
        id:     drawer
        color:  current_theme.color_ctrl_background

        x:      5
        y:      topBar.height +  topBar.anchors.topMargin + 5

        width:  250
        height: parent.height - drawer.y - 5 //parent.height

        onClosed:
            {
            hamburger_icon.set_state_menu()
            //console.log("drawer closed")
            }
        onOpened:
            {
             hamburger_icon.set_state_back()
             //console.log("drawer open")
            }
        }

    Connections
            {
            target: my_app

            function onSig_bk_list(arg_mode)
                {
                if (arg_mode === 0) image_bk_list.visible = false
                if (arg_mode === 1)
                    {
                    image_bk_list.source = "qrc:/Icon/for_file_list/bk_list_play.svg";
                    image_bk_list.visible = true
                    }
                if (arg_mode === 2)
                    {
                    image_bk_list.source = "qrc:/Icon/for_file_list/bk_list_no_play.svg";
                    image_bk_list.visible = true
                    }
                }

            //Регулятор громкости
            function onSig_vreg_id(arg_vreg_id,arg_vreg_name)
                {
                if (arg_vreg_id) //если регулятор громкости есть
                   ctrl_vol.visible = true
                else
                   ctrl_vol.visible = false
                }
            }



}
