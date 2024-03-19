import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.12
import "../S83_controls"



S83_parametr_group
{
    Layout.alignment:   Qt.AlignBottom
    Layout.fillWidth:   true

    content_component:
    ColumnLayout
        {
       // anchors.left:   parent.left
       // anchors.right:  parent.right
       // anchors.top:    parent.top
        spacing:        0

        S83_parametr_classic
        {
            id:             par_app_name

            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true

            change_padding: 5
            text_label:     "Приложение:"
            color_label:    "white"

            text_value:     "C83"
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

            text_value:     version_name
            color_value:    "yellow"

        }
        S83_parametr_classic
            {
            id:             par_developer

            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true

            change_padding: 5

            text_label:     "Обновления:"
            color_label:    "white"

            text_value:     " "
            color_value:    "yellow"



            Text
                {
                text: "На страницу"
                color: "yellow"
                font.pixelSize:         18
                anchors.right:          parent.right

                anchors.verticalCenter:   parent.verticalCenter

                anchors.rightMargin: 7
                font.underline: true
                MouseArea
                    {
                    anchors.fill: parent
                    onClicked:
                        {
                        Qt.openUrlExternally("https://cloud.mail.ru/public/rH8x/n5FJViueZ")
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



        Connections
        {
            target: my_app

            function onSig_build_date(arg_date)
            {
                par_date.text_value = arg_date
            }
        }

    }


}
