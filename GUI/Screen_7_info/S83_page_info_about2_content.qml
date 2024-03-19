import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.12
import "../S83_controls"



S83_parametr_group
{
    Layout.alignment: Qt.AlignBottom
    Layout.fillWidth: true

    content_component:
    ColumnLayout
    {
        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
        spacing:        0

        S83_parametr_classic
        {
            id:             par_app_name

            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true

            change_padding: 5
            text_label:     "Приложение:"
            color_label:    "white"

            text_value:     "-"
            color_value:    "yellow"
        }

        S83_parametr_classic
        {
            id:             par_version

            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true

            change_padding: 5

            text_label:     "Версия:"
            color_label:    "white"

            text_value:     "-"
            color_value:    "yellow"

        }


        S83_parametr_classic
        {
            id:             par_developer

            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true

            change_padding: 5

            text_label:     "Файлы проекта:"
            color_label:    "white"

            text_value:     "    "
            color_value:    "yellow"

            Text
                {
                text:                   "На страницу"
                color:                  "yellow"
                font.pixelSize:         18
                anchors.right:          parent.right
                anchors.rightMargin:    7
                anchors.verticalCenter: parent.verticalCenter
                font.underline:         true
                MouseArea
                    {
                    anchors.fill: parent
                    onClicked:
                        {
                        Qt.openUrlExternally("https://cloud.mail.ru/public/AkD7/LU5GEWmy3")
                        //var subject = "Тема письма"
                        //var body = "Тест письма"
                        //var email = "horoshevskiy_83@mail.ru"
                        //var query = "mailto:" + email +"?subject="+encodeURIComponent(subject) + "&body=" + encodeURIComponent(body);
                        //Qt.openUrlExternally(query)
                        }

                    }
                }


        }

        S83_parametr_classic
        {
            id:                 par_date

            Layout.alignment:   Qt.AlignBottom
            Layout.fillWidth:   true

            change_padding:     5

            text_label:     "Дата сборки:"
            color_label:    "white"

            text_value:     "-"
            color_value:    "yellow"

        }

        S83_parametr_classic
        {
            id:                 par_arch

            Layout.alignment:   Qt.AlignBottom
            Layout.fillWidth:   true

            change_padding:     5

            text_label:     "Архитектура CPU:"
            color_label:    "white"

            text_value:     "-"
            color_value:    "yellow"

        }

        S83_parametr_classic
            {
            id:                 par_full_size

            Layout.alignment:   Qt.AlignBottom
            Layout.fillWidth:   true

            change_padding:     5

            text_label:     "Полный объем:"
            color_label:    "white"

            text_value:     "-"
            color_value:    "yellow"
            }

        S83_parametr_classic
            {
            id:                 par_free_size

            Layout.alignment:   Qt.AlignBottom
            Layout.fillWidth:   true

            change_padding:     5

            text_label:     "Доступный объем:"
            color_label:    "white"

            text_value:     "-"
            color_value:    "yellow"
            }

        Connections
            {
            target: my_app

            //О сервере
            function onSig_about(arg_sname,arg_sv,arg_author,arg_build_date,arg_arch)
                {
                par_app_name.text_value     = arg_sname
                par_version.text_value      = arg_sv
               // par_developer.text_value    = arg_author
                par_date.text_value         = arg_build_date
                par_arch.text_value         = arg_arch
                }

            function onSig_disconnected()
                {
                var defice = "-"
                par_app_name.text_value     = defice
                par_version.text_value      = defice
               // par_developer.text_value    = defice
                par_date.text_value         = defice
                par_arch.text_value         = defice
                par_full_size.text_value    = defice;
                par_free_size.text_value    = defice;
                }

            function onSig_hdd_info (arg_space_full,arg_space_free)
                {
                par_full_size.text_value = arg_space_full;
                par_free_size.text_value = arg_space_free;
                }

            }

    }
}
