import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.12
import "../S83_controls"
import "../S83_dialogs"
import "../Enums"



S83_page_opt
    {
    id: page_colors



    content_component:
    ColumnLayout
            {
            anchors.left:   parent.left
            anchors.right:  parent.right
            anchors.top:    parent.top
            clip:           true
            spacing:        0

            S83_parametr_group
                {
                id:                 pg_colors
                name_group:         "Цвета файлов"

                Layout.alignment:   Qt.AlignBottom
                Layout.fillWidth:   true

                property bool  flag_btn_block: false

                S83_afile_ids
                    {
                    id: ids_files
                    }

                content_component:

                RowLayout
                    {
                    id: rl_rb_groups
                    spacing: 0

                ColumnLayout
                        {
                        id:     cl_group_1
                        spacing: 0
                        Layout.alignment: Qt.AlignHCenter|Qt.AlignTop

                        S83_RadioButton
                            {
                            id:             rb_flac
                            text:           "FLAC"
                            font.pixelSize: 18


                            MouseArea
                                    {
                                    id: ma_flac
                                    anchors.fill: parent
                                    onClicked:
                                        {
                                        dlg_colors.set_start_cond(ids_files.id_flac,parent.color)
                                        reset_radiobutton()
                                        parent.checked = true
                                        }

                                    }
                            }

                        S83_RadioButton
                            {
                                id:             rb_ape
                                text:           "APE"
                                font.pixelSize: 18
                                MouseArea
                                    {
                                    anchors.fill: parent
                                    onClicked:
                                        {
                                        dlg_colors.set_start_cond( ids_files.id_ape, parent.color )
                                        reset_radiobutton()
                                        parent.checked = true
                                        }
                                    }
                            }
                        S83_RadioButton
                            {
                                id:             rb_wav
                                text:           "WAV"
                                font.pixelSize: 18
                                MouseArea
                                    {
                                    anchors.fill: parent
                                    onClicked:
                                        {
                                        dlg_colors.set_start_cond( ids_files.id_wav, parent.color )
                                        reset_radiobutton()
                                        parent.checked = true

                                        }
                                    }
                            }
                        S83_RadioButton
                            {
                                id:             rb_dsf
                                text:           "DSF"
                                font.pixelSize: 18
                                MouseArea
                                    {
                                    anchors.fill: parent
                                    onClicked:
                                        {
                                        dlg_colors.set_start_cond( ids_files.id_dsf, parent.color )
                                        reset_radiobutton()
                                        parent.checked = true

                                        }
                                    }
                            }
                        S83_RadioButton
                            {
                                id:             rb_dts
                                text:           "DTS"
                                font.pixelSize: 18
                                MouseArea
                                    {
                                    anchors.fill: parent
                                    onClicked:
                                        {
                                        dlg_colors.set_start_cond( ids_files.id_dts, parent.color )
                                        reset_radiobutton()
                                        parent.checked = true
                                        }
                                    }
                            }

                        Connections
                            {
                            target: my_app

                            function onSig_color_file(arg_id_file, arg_red, arg_green, arg_blue)
                                {
                                switch (arg_id_file)
                                    {
                                    case ids_files.id_flac: rb_flac.color = Qt.rgba(arg_red, arg_green, arg_blue, 1)
                                        break
                                    case ids_files.id_ape:  rb_ape.color = Qt.rgba(arg_red, arg_green, arg_blue, 1)
                                        break
                                    case ids_files.id_wav:  rb_wav.color = Qt.rgba(arg_red, arg_green, arg_blue, 1)
                                        break
                                    case ids_files.id_dsf:  rb_dsf.color = Qt.rgba(arg_red, arg_green, arg_blue, 1)
                                        break
                                    case ids_files.id_dts:  rb_dts.color = Qt.rgba(arg_red, arg_green, arg_blue, 1)
                                        break
                                    }
                                }
                            }
                        }

                ColumnLayout
                        {
                        spacing: 0
                        Layout.alignment: Qt.AlignHCenter|Qt.AlignTop
                        S83_RadioButton
                            {
                                id:             rb_mp3
                                text:           "MP3"
                                font.pixelSize: 18
                                MouseArea
                                    {
                                    anchors.fill: parent
                                    onClicked:
                                        {
                                        dlg_colors.set_start_cond( ids_files.id_mp3, parent.color )
                                        reset_radiobutton()
                                        parent.checked = true

                                        }
                                    }
                            }
                        S83_RadioButton
                            {
                                id:             rb_ac3
                                text:           "AC3"
                                font.pixelSize: 18
                                MouseArea
                                    {
                                    anchors.fill: parent
                                    onClicked:
                                        {
                                        dlg_colors.set_start_cond( ids_files.id_ac3, parent.color )
                                        reset_radiobutton()
                                        parent.checked = true

                                        }
                                    }
                            }
                        S83_RadioButton
                            {
                                id:             rb_aac
                                text:           "AAC"
                                font.pixelSize: 18
                                MouseArea
                                    {
                                    anchors.fill: parent
                                    onClicked:
                                        {
                                        dlg_colors.set_start_cond( ids_files.id_aac, parent.color )
                                        reset_radiobutton()
                                        parent.checked = true

                                        }
                                    }
                            }
                        S83_RadioButton
                            {
                                id:             rb_m4a
                                text:           "m4a"
                                font.pixelSize: 18
                                MouseArea
                                    {
                                    anchors.fill: parent
                                    onClicked:
                                        {
                                        dlg_colors.set_start_cond( ids_files.id_m4a, parent.color )
                                        reset_radiobutton()
                                        parent.checked = true
                                        }
                                    }
                            }

                        Connections
                            {
                            target: my_app

                            function onSig_color_file(arg_id_file, arg_red, arg_green, arg_blue)
                                {
                                switch (arg_id_file)
                                    {
                                    case ids_files.id_mp3: rb_mp3.color = Qt.rgba(arg_red, arg_green, arg_blue, 1)
                                        break
                                    case ids_files.id_ac3:  rb_ac3.color = Qt.rgba(arg_red, arg_green, arg_blue, 1)
                                        break
                                    case ids_files.id_aac:  rb_aac.color = Qt.rgba(arg_red, arg_green, arg_blue, 1)
                                        break
                                    case ids_files.id_m4a:  rb_m4a.color = Qt.rgba(arg_red, arg_green, arg_blue, 1)
                                        break
                                    }
                                }
                            }
                        }

                ColumnLayout
                        {
                        spacing: 0
                        Layout.alignment: Qt.AlignHCenter|Qt.AlignTop
                        S83_RadioButton
                            {
                                id:             rb_mpc
                                text:           "MPC"
                                font.pixelSize: 18
                                MouseArea
                                    {
                                    anchors.fill: parent
                                    onClicked:
                                        {
                                        dlg_colors.set_start_cond( ids_files.id_mpc, parent.color )
                                        reset_radiobutton()
                                        parent.checked = true

                                        }
                                    }
                            }
                        S83_RadioButton
                            {
                                id:             rb_ogg
                                text:           "OGG"
                                font.pixelSize: 18
                                MouseArea
                                    {
                                    anchors.fill: parent
                                    onClicked:
                                        {
                                        dlg_colors.set_start_cond( ids_files.id_ogg, parent.color )
                                        reset_radiobutton()
                                        parent.checked = true

                                        }
                                    }
                            }
                        S83_RadioButton
                            {
                                id:             rb_wv
                                text:           "WV"
                                font.pixelSize: 18
                                MouseArea
                                    {
                                    anchors.fill: parent
                                    onClicked:
                                        {
                                        dlg_colors.set_start_cond( ids_files.id_wv, parent.color )
                                        reset_radiobutton()
                                        parent.checked = true

                                        }
                                    }
                            }
                        S83_RadioButton
                            {
                                id:             rb_wma
                                text:           "WMA"
                                font.pixelSize: 18
                                MouseArea
                                    {
                                    anchors.fill: parent
                                    onClicked:
                                        {
                                        dlg_colors.set_start_cond( ids_files.id_wma, parent.color )
                                        reset_radiobutton()
                                        parent.checked = true

                                        }
                                    }
                            }
                        Connections
                            {
                            target: my_app

                            function onSig_color_file(arg_id_file, arg_red, arg_green, arg_blue)
                                {
                                switch (arg_id_file)
                                    {
                                    case ids_files.id_mpc: rb_mpc.color = Qt.rgba(arg_red, arg_green, arg_blue, 1)
                                        break
                                    case ids_files.id_ogg:  rb_ogg.color = Qt.rgba(arg_red, arg_green, arg_blue, 1)
                                        break
                                    case ids_files.id_wv:  rb_wv.color = Qt.rgba(arg_red, arg_green, arg_blue, 1)
                                        break
                                    case ids_files.id_wma:  rb_wma.color = Qt.rgba(arg_red, arg_green, arg_blue, 1)
                                        break

                                    }
                                }
                            }
                        }

                ColumnLayout
                        {
                        spacing: 0
                        Layout.alignment: Qt.AlignHCenter|Qt.AlignTop
                        S83_RadioButton
                            {
                                id: rb_dir
                                text: "DIR"
                                font.pixelSize: 18
                                MouseArea
                                    {
                                    anchors.fill: parent
                                    onClicked:
                                        {
                                        dlg_colors.set_start_cond( ids_files.id_dir, parent.color )
                                        reset_radiobutton()
                                        parent.checked = true

                                        }
                                    }
                            }
                        S83_RadioButton
                            {
                                id:             rb_bk
                                text:           "BACK"
                                font.pixelSize: 18
                                MouseArea
                                    {
                                    anchors.fill: parent
                                    onClicked:
                                        {
                                        dlg_colors.set_start_cond( ids_files.id_back, parent.color )
                                        reset_radiobutton()
                                        parent.checked = true

                                        }
                                    }
                            }
                        S83_RadioButton
                            {
                                id:             rb_poff
                                text:           "POFF"
                                font.pixelSize: 18
                                MouseArea
                                    {
                                    anchors.fill: parent
                                    onClicked:
                                        {
                                        dlg_colors.set_start_cond( ids_files.id_poff, parent.color )
                                        reset_radiobutton()
                                        parent.checked = true

                                        }
                                    }
                            }
                        S83_RadioButton
                            {
                                id:             rb_cue
                                text:           "CUE"
                                font.pixelSize: 18
                                MouseArea
                                    {
                                    anchors.fill: parent
                                    onClicked:
                                        {
                                        dlg_colors.set_start_cond( ids_files.id_cue, parent.color )
                                        reset_radiobutton()
                                        parent.checked = true

                                        }
                                    }
                            }

                        S83_RadioButton
                            {
                                id:             rb_url
                                text:           "URL"
                                font.pixelSize: 18
                                MouseArea
                                    {
                                    anchors.fill: parent
                                    onClicked:
                                        {
                                        dlg_colors.set_start_cond( ids_files.id_url, parent.color )
                                        reset_radiobutton()
                                        parent.checked = true

                                        }
                                    }
                            }

                   //    Item
                   //         {
                   //         id: it_tmp
                   //         height: 50

                   //         }

                        Connections
                            {
                            target: my_app

                            function onSig_color_file(arg_id_file, arg_red, arg_green, arg_blue)
                                {
                                switch (arg_id_file)
                                    {
                                    case ids_files.id_dir: rb_dir.color = Qt.rgba(arg_red, arg_green, arg_blue, 1)
                                        break
                                    case ids_files.id_back:  rb_bk.color = Qt.rgba(arg_red, arg_green, arg_blue, 1)
                                        break
                                    case ids_files.id_poff:  rb_poff.color = Qt.rgba(arg_red, arg_green, arg_blue, 1)
                                        break
                                    case ids_files.id_cue:  rb_cue.color = Qt.rgba(arg_red, arg_green, arg_blue, 1)
                                        break
                                    case ids_files.id_url:  rb_url.color = Qt.rgba(arg_red, arg_green, arg_blue, 1)
                                        break
                                    }
                                }
                            }

                        Rectangle
                            {
                            color: "transparent"
                            height: 45
                            }
                        }

                function reset_radiobutton ()
                    {
                    pg_colors.flag_btn_block = true

                    rb_flac.checked = false
                    rb_ape.checked = false
                    rb_wav.checked = false
                    rb_dsf.checked = false
                    rb_dts.checked = false

                    rb_mp3.checked = false
                    rb_ac3.checked = false
                    rb_aac.checked = false
                    rb_m4a.checked = false

                    rb_mpc.checked = false
                    rb_ogg.checked = false
                    rb_wv.checked  = false
                    rb_wma.checked = false


                    rb_dir.checked  = false
                    rb_bk.checked   = false
                    rb_poff.checked = false
                    rb_cue.checked  = false
                    rb_url.checked  = false
                    }

                }




                //Кнопки
                RowLayout
                    {
                    spacing: 10
                    anchors.bottom:             parent.bottom
                    anchors.horizontalCenter:   parent.horizontalCenter

                    S83_Button
                            {
                            text:      "    Изменить    "
                            btn_color: current_theme.color_ctrl_main_color
                            enabled:  pg_colors.flag_btn_block

                            onClicked:
                                {
                                dlg_colors.visible = true
                                }
                            }


                    S83_Button
                            {
                            text:      "    Сбросить    "
                            btn_color: current_theme.color_ctrl_main_color
                            onClicked: dialog_reset_colors.visible = true
                            }
                    }

                }





        }

    }


