function Controller() {
    installer.autoRejectMessageBoxes();
    installer.installationFinished.connect(function() {
        gui.clickButton(buttons.NextButton);
    })
}

Controller.prototype.WelcomePageCallback = function() {
    console.log("Welcome Page");
    var widget = gui.currentPageWidget();
    widget.completeChanged.connect(function() {
        // For some reason, this page needs some delay.
        gui.clickButton(buttons.NextButton);
    });
}

Controller.prototype.CredentialsPageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.IntroductionPageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.TargetDirectoryPageCallback = function() {
    gui.currentPageWidget().TargetDirectoryLineEdit.setText(installer.environmentVariable("QT_INSTALL_DIR"));
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.ComponentSelectionPageCallback = function() {
    console.log("Component Selection Page");

    var components = installer.components();
    console.log("Available packages: " + components.length);
    var packages = ["===LIST OF PACKAGES==="];
    for (var i = 0 ; i < components.length ;i++) {
        packages.push(components[i].name + "    " + components[i].displayName);
    }
    packages.push("===END OF PACKAGES===");
    console.log(packages.join("\n"));

    var widget = gui.currentPageWidget();
    widget.deselectAll();    
    widget.selectComponent("qt.qt5.5123.win64_msvc2017_64");
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.LicenseAgreementPageCallback = function() {
    gui.currentPageWidget().AcceptLicenseRadioButton.setChecked(true);
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.StartMenuDirectoryPageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.ReadyForInstallationPageCallback = function() {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.FinishedPageCallback = function() {
    var checkBoxForm = gui.currentPageWidget().LaunchQtCreatorCheckBoxForm;
    if (checkBoxForm && checkBoxForm.launchQtCreatorCheckBox)
        checkBoxForm.launchQtCreatorCheckBox.checked = false;
    gui.clickButton(buttons.FinishButton);
}
