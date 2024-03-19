import QtQuick 2.0

Item
    {
        property color color_background:        "black"     //Цвет фона

        property color color_ctrl_background:   "#181818"   //Фоновый цвет области с контролами
        property color color_ctrl_selected:     "#202020"   //Выделенный элемент в области элементов

        property color color_ctrl_main_color:   "chocolate" //Основной темный цвет органа управления

        property color color_ctrl_parametr_name:            "#DDDDDD"       //Цвет имени параметра
        property color color_ctrl_parametr_value:           "yellow"        //Цвет значения параметра
        property color color_ctrl_parametr_value_warning:   "red"           //Цвет значения параметра который изменяется сейчас]
        property color color_ctrl_parametr_value_selected:   "chocolate"    //Цвет выделеного значения

        property color color_ctrl_cursor_border:    "white" //Цвет контура курсора списка файлов
        property color color_ctrl_cursor:           "#202020"  //Цвет курсора списка файлов
        property color color_ctrl_disable:          "#404040"  //Цвет отключенного элемента
    }
