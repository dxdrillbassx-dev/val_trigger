#NoEnv
#Persistent
#MaxThreadsPerHotkey 2
#KeyHistory 0
ListLines Off
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
CoordMode, Pixel, Screen

; Default Settings
PixelBox := 2.3
PixelSens := 50
PixelColor := 0xFEFE40
TapTime := 0
HoldKey := "Alt" ; Default Hold Key
Language := "English" ; Default language

; GUI Creation
Gui, +AlwaysOnTop +ToolWindow -Caption +LastFound ; Always on top, no taskbar icon, no title bar
Gui, Color, 2E2E2E ; Set dark background color
Gui, Font, s10, Segoe UI ; Set font for the GUI

; Tab Control
Gui, Add, Tab2, x10 y10 w500 h580 cFFA500 vTabControl, % (Language = "English" ? "Trigger by DXDRILLBASSX© 2024 v.0.2.1" : "Триггер от DXDRILLBASSX© 2024 v.0.2.1")

; Trigger Tab
Gui, Tab, % (Language = "English" ? "Trigger by DXDRILLBASSX© 2024 v.0.2.1" : "Триггер от DXDRILLBASSX© 2024 v.0.2.1")

; Settings Block (now on Trigger tab)
Gui, Add, GroupBox, x20 y40 w220 h240 cFFA500 vSettingsGroupBox, % (Language = "English" ? "Settings" : "Настройки")
Gui, Add, Text, cFFFFFF x30 y70 w90 vSettingsPixelBoxLabel, % (Language = "English" ? "Pixel Box:" : "Пиксельная область:")
Gui, Add, Edit, x120 y70 w80 vPixelBox c000000 Background000000, %PixelBox%
Gui, Add, Text, cFFFFFF x30 y100 w90 vSettingsPixelSensLabel, % (Language = "English" ? "Pixel Sensitivity:" : "Чувствительность пикселя:")
Gui, Add, Edit, x120 y100 w80 vPixelSens c000000 Background000000, %PixelSens%
Gui, Add, Text, cFFFFFF x30 y130 w90 vSettingsPixelColorLabel, % (Language = "English" ? "Pixel Color:" : "Цвет пикселя:")
Gui, Add, Edit, x120 y130 w80 vPixelColor c000000 Background000000, %PixelColor%
Gui, Add, Text, cFFFFFF x30 y160 w90 vSettingsTapTimeLabel, % (Language = "English" ? "Tap Time (ms):" : "Время нажатия (мс):")
Gui, Add, Edit, x120 y160 w80 vTapTime c000000 Background000000, %TapTime%
Gui, Add, Text, cFFFFFF x30 y190 w90 vSettingsHoldKeyLabel, % (Language = "English" ? "Hold Key:" : "Ключ удержания:")
Gui, Add, Edit, x120 y190 w80 vHoldKey c000000 Background000000, %HoldKey%

; Info Block
Gui, Add, GroupBox, x20 y300 w220 h100 cFFA500 vInfoGroupBox, % (Language = "English" ? "Info" : "Информация")
Gui, Add, Text, cFFFFFF x30 y330 w200 vInfoStatus, % (Language = "English" ? "Status: Not started" : "Статус: Не запущен")
Gui, Add, Text, cFFFFFF x30 y360 w200 vInfoToggle, % (Language = "English" ? "Toggle GUI with F2" : "Переключить GUI с помощью F2")

; Color Block (move color labels and codes 160 pixels to the right)
Gui, Add, GroupBox, x250 y40 w150 h160 cFFA500 vColorGroupBox, % (Language = "English" ? "Color" : "Цвет")
Gui, Add, Text, cFFFFFF x260 y70 w60 vColorYellowLabel, % (Language = "English" ? "Yellow:" : "Жёлтый:")
Gui, Add, Text, x330 y70 cFEFE40 vColorYellowCode, 0xFEFE40
Gui, Add, Text, cFFFFFF x260 y110 w60 vColorPurpleLabel, % (Language = "English" ? "Purple:" : "Пурпур:")
Gui, Add, Text, x330 y110 cA145A3 vColorPurpleCode, 0xA145A3
Gui, Add, Text, cFFFFFF x260 y150 w60 vColorRedLabel, % (Language = "English" ? "Red:" : "Красный:")
Gui, Add, Text, x330 y150 cB82C29 vColorRedCode, 0xB82C29

; Language Block (now on Trigger tab)
Gui, Add, GroupBox, x410 y40 w90 h160 cFFA500 vLanguageGroupBox, % (Language = "English" ? "Language" : "Язык")
Gui, Add, Radio, x420 y70 vLangEng gSetLanguage cFFFFFF Background2E2E2E, % (Language = "English" ? "English" : "Английский")
Gui, Add, Radio, x420 y110 vLangRus gSetLanguage cFFFFFF Background2E2E2E, % (Language = "English" ? "Russian" : "Русский")

; Set default language
GuiControl,, LangEng, 1

; Select Mode Block
Gui, Add, GroupBox, x250 y220 w250 h180 cFFA500 vSelectModeGroupBox, % (Language = "English" ? "Select Mode" : "Выберите режим")
Gui, Add, Button, x300 y240 w150 h30 gStayOn vBtnStayOn cFFFFFF BackgroundFF8C00, % (Language = "English" ? "Constant Clicking" : "Постоянный клик")
Gui, Add, Button, x300 y280 w150 h30 gHoldMode vBtnHoldMode cFFFFFF BackgroundFF8C00, % (Language = "English" ? "Hold Mode" : "Режим удержания")
Gui, Add, Button, x300 y320 w150 h30 gOffLoop vBtnOffLoop cFFFFFF BackgroundFF8C00, % (Language = "English" ? "Turn Off" : "Выключить")
Gui, Add, Button, x300 y360 w150 h30 gTerminate vBtnTerminate cFFFFFF BackgroundFF8C00, % (Language = "English" ? "Exit Script" : "Выйти из скрипта")

; How to Use Block (moved up and extended)
Gui, Add, GroupBox, x20 y400 w480 h130 cFFA500 vHowToUseGroupBox, % (Language = "English" ? "How to Use?" : "Как использовать?")
Gui, Add, Text, cFFFFFF x30 y420 w300 vHowToUseStep1, % (Language = "English" ? "1. Adjust the settings as needed." : "1. Настройте параметры по необходимости.")
Gui, Add, Text, cFFFFFF x30 y440 w300 vHowToUseStep2, % (Language = "English" ? "2. Choose the desired mode." : "2. Выберите желаемый режим.")
Gui, Add, Text, cFFFFFF x30 y460 w400 vHowToUseStep3, % (Language = "English" ? "3. Click 'Apply Settings' to save changes." : "3. Нажмите 'Применить настройки', чтобы сохранить изменения.")
Gui, Add, Text, cFFFFFF x30 y480 w400 vHowToUseStep4, % (Language = "English" ? "4. Use F2 to toggle the GUI visibility." : "4. Используйте F2 для переключения видимости GUI.")
Gui, Add, Text, cB82C29 x30 y505 w400 vHowToUseImportant, % (Language = "English" ? "Important!!! Turn off mouse buffer in game settings." : "Важно!!! Отключите буферизацию мыши в настройках игры.")

; Apply Settings Button
Gui, Add, Button, x20 y540 w480 h40 gApplySettings vBtnApplySettings cFFFFFF BackgroundFF8C00, % (Language = "English" ? "Apply Settings" : "Применить настройки")

Gui, Show, w520 h600, % (Language = "English" ? "AHK Script GUI" : "GUI скрипта AHK")

; Make the window draggable
Gui +LastFound
OnMessage(0x201, "WM_LBUTTONDOWN")
WM_LBUTTONDOWN() {
    PostMessage, 0xA1, 2
}

StayOn:
    SoundBeep, 300, 200
    GuiControl,, InfoStatus, % (Language = "English" ? "Status: Constant Mode" : "Статус: Постоянный режим")
    SetTimer, loop2, Off
    SetTimer, loop1, 1
return

HoldMode:
    SoundBeep, 300, 200
    GuiControl,, InfoStatus, % (Language = "English" ? "Status: Hold Mode" : "Статус: Режим удержания")
    SetTimer, loop1, Off
    SetTimer, loop2, 1
return

OffLoop:
    SoundBeep, 300, 200
    GuiControl,, InfoStatus, % (Language = "English" ? "Status: Turned Off" : "Статус: Выключен")
    SetTimer, loop1, Off
    SetTimer, loop2, Off
return

Terminate:
    SoundBeep, 300, 200
    SoundBeep, 200, 200
    Sleep 400
    ExitApp
return

ApplySettings:
    Gui, Submit, NoHide
return

loop1:
    PixelSearch()
return

loop2:
    If GetKeyState(HoldKey, "P"){
        PixelSearch()
    }
return

#If toggle
*~$LButton::
    Sleep 1
    While GetKeyState("LButton", "P"){
        Click
        Sleep 1
    }
return
#If

PixelSearch() {
    global PixelBox, PixelSens, PixelColor, TapTime
    PixelSearch, FoundX, FoundY, A_ScreenWidth/2-PixelBox, A_ScreenHeight/2-PixelBox, A_ScreenWidth/2+PixelBox, A_ScreenHeight/2+PixelBox, PixelColor, PixelSens, Fast RGB
    If !(ErrorLevel){
        If !GetKeyState("LButton"){
            Click
            Sleep TapTime
        }
    }
return
}

F2:: ; Hotkey for the F2 key
    If (GuiVisible := !GuiVisible) ; Toggle the GuiVisible variable
        Gui, Show
    Else
        Gui, Hide
return

SetLanguage:
    Gui, Submit, NoHide
    If (LangEng) {
        Language := "English"
    } else if (LangRus) {
        Language := "Russian"
    }
    
    ; Update all labels and buttons with the selected language
    GuiControl,, SettingsGroupBox, % (Language = "English" ? "Settings" : "Настройки")
    GuiControl,, SettingsPixelBoxLabel, % (Language = "English" ? "Pixel Box:" : "Пикс. обл:")
    GuiControl,, SettingsPixelSensLabel, % (Language = "English" ? "Pixel Sensitivity:" : "Чувств. пикс:")
    GuiControl,, SettingsPixelColorLabel, % (Language = "English" ? "Pixel Color:" : "Цвет пикселя:")
    GuiControl,, SettingsTapTimeLabel, % (Language = "English" ? "Tap Time (ms):" : "Время нажат:")
    GuiControl,, SettingsHoldKeyLabel, % (Language = "English" ? "Hold Key:" : "Бинд:")
    
    GuiControl,, InfoGroupBox, % (Language = "English" ? "Info" : "Информация")
    GuiControl,, InfoStatus, % (Language = "English" ? "Status: Not started" : "Статус: Не запущен")
    GuiControl,, InfoToggle, % (Language = "English" ? "Toggle GUI with F2" : "Переключить GUI с помощью F2")
    
    GuiControl,, ColorGroupBox, % (Language = "English" ? "Color" : "Цвет")
    GuiControl,, ColorYellowLabel, % (Language = "English" ? "Yellow:" : "Жёлтый:")
    GuiControl,, ColorPurpleLabel, % (Language = "English" ? "Purple:" : "Пурпур:")
    GuiControl,, ColorRedLabel, % (Language = "English" ? "Red:" : "Красный:")
    
    GuiControl,, LanguageGroupBox, % (Language = "English" ? "Language" : "Язык")
    
    GuiControl,, SelectModeGroupBox, % (Language = "English" ? "Select Mode" : "Выберите режим")
    GuiControl,, BtnStayOn, % (Language = "English" ? "Constant Clicking" : "Постоянный клик")
    GuiControl,, BtnHoldMode, % (Language = "English" ? "Hold Mode" : "Режим удержания")
    GuiControl,, BtnOffLoop, % (Language = "English" ? "Turn Off" : "Выключить")
    GuiControl,, BtnTerminate, % (Language = "English" ? "Exit Script" : "Выйти из скрипта")
    
    GuiControl,, HowToUseGroupBox, % (Language = "English" ? "How to Use?" : "Как использовать?")
    GuiControl,, HowToUseStep1, % (Language = "English" ? "1. Adjust the settings as needed." : "1. Настройте параметры по необходимости.")
    GuiControl,, HowToUseStep2, % (Language = "English" ? "2. Choose the desired mode." : "2. Выберите желаемый режим.")
    GuiControl,, HowToUseStep3, % (Language = "English" ? "3. Click 'Apply Settings' to save changes." : "3. Нажмите 'Применить настройки', чтобы сохранить изменения.")
    GuiControl,, HowToUseStep4, % (Language = "English" ? "4. Use F2 to toggle the GUI visibility." : "4. Используйте F2 для переключения видимости GUI.")
    GuiControl,, HowToUseImportant, % (Language = "English" ? "Important!!! Turn off mouse buffer in game settings." : "Важно!!! Отключите буферизацию мыши в настройках игры.")
    
    GuiControl,, BtnApplySettings, % (Language = "English" ? "Apply Settings" : "Применить настройки")

    ; Redraw GUI
    Gui, Show, w520 h600, % (Language = "English" ? "AHK Script GUI" : "GUI скрипта AHK")
return
