import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.12
import "../S83_controls"
import "../Enums"

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
            id:             par_bp

            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true

            change_padding: 5
            text_label:     "Преобразование потока:"
            color_label:    "white"

            text_value:     "-"
            color_value:    "yellow"
        }

        S83_parametr_classic
            {
            id:             par_swr1_state

            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true

            change_padding: 5

            text_label:     "Фильтр \"SWR 1\":"
            color_label:    "white"

            text_value:     "-"
            color_value:    "yellow"
            }



        S83_parametr_classic
            {
            id:             par_eq_state

            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true

            change_padding: 5

            text_label:     "Фильтр \"SWEQ\":"
            color_label:    "white"

            text_value:     "-"
            color_value:    "yellow"

            }

        S83_parametr_classic
            {
            id:             par_svol_state

            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true

            change_padding: 5

            text_label:     "Фильтр \"SWVOL\":"
            color_label:    "white"

            text_value:     "-"
            color_value:    "yellow"

            }

        S83_parametr_classic
            {
            id:             par_swr2_state

            Layout.alignment: Qt.AlignBottom
            Layout.fillWidth: true

            change_padding: 5

            text_label:     "Фильтр \"SWR 2\":"
            color_label:    "white"

            text_value:     "-"
            color_value:    "yellow"
            }



        S83_vreg_ids {id: vreg_ids}

        Connections
        {
            target: my_app

            function onSig_disconnected()
                {
                var defice = "-"
                par_bp.text_value           = defice
                par_eq_state.text_value     = defice
                par_swr1_state.text_value   = defice
                par_swr2_state.text_value   = defice
                par_svol_state.text_value   = defice
                }

            //Преобразование потока
            function onSig_convert_state(arg_bp, swr1_state, swr2_state, swvol )
                {
                if (arg_bp)
                    {
                    par_bp.text_value = "нет"
                    par_bp.color_value = current_theme.color_ctrl_parametr_value
                    }
                else
                    {
                    par_bp.text_value = "да"
                    par_bp.color_value = current_theme.color_ctrl_parametr_value_selected
                    }

                if (!swr1_state)
                    {
                    par_swr1_state.text_value = "нет"
                    par_swr1_state.color_value = current_theme.color_ctrl_parametr_value
                    }
                else
                    {
                    par_swr1_state.text_value = "да"
                    par_swr1_state.color_value = current_theme.color_ctrl_parametr_value_selected
                    }

                if (!swr2_state)
                    {
                    par_swr2_state.text_value = "нет"
                    par_swr2_state.color_value = current_theme.color_ctrl_parametr_value
                    }
                else
                    {
                    par_swr2_state.text_value = "да"
                    par_swr2_state.color_value = current_theme.color_ctrl_parametr_value_selected
                    }

                if (!swvol)
                    {
                    par_svol_state.text_value = "нет"
                    par_svol_state.color_value = current_theme.color_ctrl_parametr_value
                    }
                else
                    {
                    par_svol_state.text_value = "да"
                    par_svol_state.color_value = current_theme.color_ctrl_parametr_value_selected
                    }

                }

            //Состояние эквалайзера
            function onSig_eq_flag_player(arg_value)
                {
                if (arg_value)
                    {
                    par_eq_state.text_value = "да"
                    par_eq_state.color_value = current_theme.color_ctrl_parametr_value_selected
                    }
                else
                    {
                    par_eq_state.text_value = "нет"
                    par_eq_state.color_value = current_theme.color_ctrl_parametr_value
                    }
                }


        }

    }


}
