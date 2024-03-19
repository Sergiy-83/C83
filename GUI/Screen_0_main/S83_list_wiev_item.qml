import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.12


Rectangle
{
    width:          listViewFile.width - 6
    height:         35



    color:          listViewFile.current_index === index ? current_theme.color_ctrl_cursor          : "transparent"
    border.color:   listViewFile.current_index === index ? current_theme.color_ctrl_cursor_border   : "transparent"
    radius:         5

    property int text_list_item_string_size:    18
    property int def_margin:                    5
    property int text_y_correction:             -2


    function get_icon(icon,flags)
        {
        timer_r.running = false
//        if (flags & 0x20) return "qrc:/Icon/for_file/check.svg";
        switch(icon)
            {
            case 0:     return "qrc:/Icon/for_file/back.ico";
            case 1:     return "qrc:/Icon/for_file/folder.ico";
            case 2:     return "qrc:/Icon/for_file/spk.ico";
            case 3:     timer_r.running = true
                        return "qrc:/Icon/for_file/play.svg";
            case 4:     return "qrc:/Icon/for_file/pause.svg";
            case 5:     return "qrc:/Icon/for_file/poff.ico";
            default:    return "qrc:/Icon/for_file/def.ico";
            }
        }


    //Иконка оснавная
    Image
            {
            id:                     icon_file
            width:                  28
            height:                 28
            visible:                true
            anchors.verticalCenter: parent.verticalCenter
            anchors.left:           parent.left
            anchors.leftMargin:     def_margin
            source:                 get_icon(nIc,nFl)
            RotationAnimation
                {
                id:         rotat_play
                 target:     icon_file
                property:   "rotation"
                from: 0
                to:   120
                duration:   1000
                running:    false
                }
            Timer
                {
                id:       timer_r
                interval: 7000
                repeat:   true
                running:  false
                property int state_r: 0
                onTriggered:
                    {
                    if (state_r === 0)
                        {
                        rotat_play.from = 0
                        rotat_play.to   = 120
                        state_r         = 1
                        rotat_play.running = true
                        }

                    if (state_r === 1)
                        {
                        rotat_play.from = 120
                        rotat_play.to   = 240
                        state_r         = 2
                        rotat_play.running = true
                        }
                    if (state_r === 2)
                        {
                        rotat_play.from = 240
                        rotat_play.to = 360
                        state_r = 0
                        rotat_play.running = true
                        }
                    }
                  }
            }


    //Иконка check
    Image
            {
            id:                     icon_check
            width:                  28
            height:                 28

            visible:                nFl & 0x20

            anchors.verticalCenter: parent.verticalCenter
            anchors.left:           parent.left
            anchors.leftMargin:     def_margin
            source:                 "qrc:/Icon/for_file/check.svg"



            }

    Connections
        {
        target: my_app
        function onSig_mark(arg_index,arg_value)
             {
             if (arg_index === model.index)
                {
                //console.log("onSig_mark - " + arg_index +" - "+ arg_value)

                if (arg_value)
                   {
                   icon_check.visible = true
                   //icon_file.source = get_icon(model.nIc,32)
                   }
                else
                   {
                   icon_check.visible = false
                   //icon_file.source = get_icon(model.nIc,0)
                   }
                }
            }
        }

        //Имя файла
        Text
            {
            text:                           nF
            width:                          100

            anchors.right:                  nE ? text_ext.left : text_ext.right //Если расширение пустое то выравниваем по правому краю расширения
            anchors.left:                   icon_file.right
            anchors.leftMargin:             def_margin
            anchors.rightMargin:            5
            anchors.verticalCenter:         parent.verticalCenter
            anchors.verticalCenterOffset:   text_y_correction

            elide:                          Text.ElideRight  //Сокращение точками
            //clip: true


            Layout.fillWidth:               true
            //font.bold: true
            color:                          nCl
            font.pixelSize:                 text_list_item_string_size
            }

        //Расширение
        Text
            {
            id:                             text_ext
            width:                          45
            text:                           nE
            anchors.verticalCenter:         parent.verticalCenter
            anchors.verticalCenterOffset:   text_y_correction

            anchors.right:                  parent.right
            anchors.leftMargin:             def_margin
            anchors.rightMargin:            def_margin
            //font.bold: true
            elide:                          Text.ElideRight
            color:                          nCl
            font.pixelSize:                 text_list_item_string_size
            }

        MouseArea
            {
            anchors.right:  parent.right
            anchors.top:    parent.top
            anchors.bottom: parent.bottom
            anchors.left:   icon_file.right

            onClicked:
                {
                //console.log("out: Курсор. (index): "+ index)
                my_app.slot_click_on_item(index)
                }

            onDoubleClicked:
                {
                //console.log("out: Двойной клик по итему. (index): "+ index)
                my_app.slot_open() //открыть
                }

            onPressAndHold:
                {
                //console.log("out: Запрашиваем контекстное меню. (index): "+ index)
                my_app.slot_click_on_item(index)    //Установим сюда курсор
                my_app.slot_context_menu();         //Запрашиваем контекстное меню
                }
            }
        MouseArea
            {
            anchors.fill:   icon_file

            onClicked:
                {
                //console.log("out: Выделить (index): "+ index)
                my_app.slot_mark(index)
                }


            onDoubleClicked:
                {
                //console.log("out: Двойной клик по итему. (index): "+ index)
                my_app.slot_open() //открыть
                }

            onPressAndHold:
                {
                //console.log("out: Запрашиваем контекстное меню. (index): "+ index)
                my_app.slot_click_on_item(index)    //Установим сюда курсор
                my_app.slot_context_menu();         //Запрашиваем контекстное меню
                }
            }


}
