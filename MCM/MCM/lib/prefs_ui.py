# -*- coding: utf-8 -*-
#
#  PyiiASMH (prefs_ui.py)
#  Copyright (c) 2011, 2012, Sean Power
#  All rights reserved.
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions are met:
#      * Redistributions of source code must retain the above copyright
#        notice, this list of conditions and the following disclaimer.
#      * Redistributions in binary form must reproduce the above copyright
#        notice, this list of conditions and the following disclaimer in the
#        documentation and/or other materials provided with the distribution.
#      * Neither the names of the authors nor the
#        names of its contributors may be used to endorse or promote products
#        derived from this software without specific prior written permission.
#   
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
#  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#  DISCLAIMED. IN NO EVENT SHALL SEAN POWER BE LIABLE FOR ANY
#  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
#  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

try:
    from PySide import QtCore, QtGui
except ImportError:
    from PyQt4 import QtCore, QtGui

class PrefsUi(QtGui.QDialog):
    def __init__(self):
        super(PrefsUi, self).__init__()

        self.setupUi()

    def setupUi(self):
        self.setObjectName("Dialog")
        self.resize(300, 190)
        self.setMinimumSize(QtCore.QSize(300, 190))
        self.setBaseSize(QtCore.QSize(300, 190))
        self.setModal(True)
        self.buttonBox = QtGui.QDialogButtonBox(self)
        self.buttonBox.setGeometry(QtCore.QRect(10, 150, 281, 32))
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(QtGui.QDialogButtonBox.Cancel|QtGui.QDialogButtonBox.Ok)
        self.buttonBox.setObjectName("buttonBox")
        self.formLayoutWidget = QtGui.QWidget(self)
        self.formLayoutWidget.setGeometry(QtCore.QRect(10, 10, 271, 61))
        self.formLayoutWidget.setObjectName("formLayoutWidget")
        self.checkBoxLayout = QtGui.QGridLayout(self.formLayoutWidget)
        self.checkBoxLayout.setContentsMargins(0, 0, 0, 0)
        self.checkBoxLayout.setVerticalSpacing(10)
        self.checkBoxLayout.setObjectName("checkBoxLayout")
        self.loadLast = QtGui.QCheckBox(self.formLayoutWidget)
        self.loadLast.setObjectName("loadLast")
        self.checkBoxLayout.addWidget(self.loadLast, 1, 0, 1, 1)
        self.confirmation = QtGui.QCheckBox(self.formLayoutWidget)
        self.confirmation.setChecked(True)
        self.confirmation.setObjectName("confirmation")
        self.checkBoxLayout.addWidget(self.confirmation, 0, 0, 1, 1)
        self.gridLayoutWidget = QtGui.QWidget(self)
        self.gridLayoutWidget.setGeometry(QtCore.QRect(10, 80, 271, 58))
        self.gridLayoutWidget.setObjectName("gridLayoutWidget")
        self.comboBoxLayout = QtGui.QGridLayout(self.gridLayoutWidget)
        self.comboBoxLayout.setContentsMargins(0, 0, 0, 0)
        self.comboBoxLayout.setVerticalSpacing(10)
        self.comboBoxLayout.setObjectName("comboBoxLayout")
        self.codetypeSelect = QtGui.QComboBox(self.gridLayoutWidget)
        self.codetypeSelect.setObjectName("codetypeSelect")
        self.codetypeSelect.addItem("")
        self.codetypeSelect.addItem("")
        self.codetypeSelect.addItem("")
        self.codetypeSelect.addItem("")
        self.comboBoxLayout.addWidget(self.codetypeSelect, 0, 1, 1, 1)
        self.codetypeLabel = QtGui.QLabel(self.gridLayoutWidget)
        self.codetypeLabel.setObjectName("codetypeLabel")
        self.comboBoxLayout.addWidget(self.codetypeLabel, 0, 0, 1, 1)
        self.qtstyleSelect = QtGui.QComboBox(self.gridLayoutWidget)
        self.qtstyleSelect.setObjectName("qtstyleSelect")
        self.comboBoxLayout.addWidget(self.qtstyleSelect, 1, 1, 1, 1)
        self.qtstyleLabel = QtGui.QLabel(self.gridLayoutWidget)
        self.qtstyleLabel.setObjectName("qtstyleLabel")
        self.comboBoxLayout.addWidget(self.qtstyleLabel, 1, 0, 1, 1)

        self.retranslateUi()
        self.codetypeSelect.setCurrentIndex(3)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL("accepted()"), self.accept)
        QtCore.QObject.connect(self.buttonBox, QtCore.SIGNAL("rejected()"), self.reject)
        QtCore.QMetaObject.connectSlotsByName(self)

    def retranslateUi(self):
        self.setWindowTitle(QtGui.QApplication.translate("Dialog", "Preferences", None, QtGui.QApplication.UnicodeUTF8))
        self.loadLast.setText(QtGui.QApplication.translate("Dialog", "Load last session on startup", None, QtGui.QApplication.UnicodeUTF8))
        self.confirmation.setToolTip(QtGui.QApplication.translate("Dialog", "Show confirmation dialogs for starting a new session, saving, reloading, or exiting the application.", None, QtGui.QApplication.UnicodeUTF8))
        self.confirmation.setText(QtGui.QApplication.translate("Dialog", "Confirmation Dialogs", None, QtGui.QApplication.UnicodeUTF8))
        self.codetypeSelect.setItemText(0, QtGui.QApplication.translate("Dialog", "C0", None, QtGui.QApplication.UnicodeUTF8))
        self.codetypeSelect.setItemText(1, QtGui.QApplication.translate("Dialog", "C2/D2", None, QtGui.QApplication.UnicodeUTF8))
        self.codetypeSelect.setItemText(2, QtGui.QApplication.translate("Dialog", "F2/F4", None, QtGui.QApplication.UnicodeUTF8))
        self.codetypeSelect.setItemText(3, QtGui.QApplication.translate("Dialog", "RAW", None, QtGui.QApplication.UnicodeUTF8))
        self.codetypeLabel.setText(QtGui.QApplication.translate("Dialog", "Default Codetype:", None, QtGui.QApplication.UnicodeUTF8))
        self.qtstyleLabel.setText(QtGui.QApplication.translate("Dialog", "GUI Style:", None, QtGui.QApplication.UnicodeUTF8))

