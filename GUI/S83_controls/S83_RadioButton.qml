/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt Quick Controls 2 module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL3$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or later as published by the Free
** Software Foundation and appearing in the file LICENSE.GPL included in
** the packaging of this file. Please review the following information to
** ensure the GNU General Public License version 2.0 requirements will be
** met: http://www.gnu.org/licenses/gpl-2.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

T.RadioButton {
    id: control
    property string color:          "white"
    property string color_disable:  "gray"
    property string color_point:    current_theme.color_ctrl_main_color
    property bool value_warning: false

    implicitWidth:  Math.max(implicitBackgroundWidth + leftInset + rightInset, implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset, implicitContentHeight + topPadding + bottomPadding, implicitIndicatorHeight + topPadding + bottomPadding)

    spacing: 8
    padding: 8
    verticalPadding: padding + 6
    font.weight:    value_warning ? Font.Bold : Font.Normal // Устанавливаем жирный шрифт

    indicator:
    S83_RadioIndicator
        {
        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
        color_disable:  control.color_disable
        color_point:    control.color_point
        control:        control
        }

    contentItem:
    Text
        {
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing + 1 : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing + 1 : 0

        text:   control.text
        font:   control.font
        color:  control.enabled ? control.color : control.color_disable
        elide:  Text.ElideRight
        verticalAlignment: Text.AlignVCenter
        }
}
