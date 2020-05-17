#####################################################################################################################################################
#                                                                                                                                                   #
#                         VARIABLES                                                                                                                 #
#                                                                                                                                                   #
#####################################################################################################################################################

#List of Drives To Map
$DriveList = @("0.  DGL_Data","1.  P1","2.  DGLFSG3","3.  p3 (TPC)","4.  p4","6.  p6","7.  p7","8.  p8","9.  p9","10. p10","11. p11","12. p12")
#Displays With Drive to Map
#####################################################################################################################################################
#                                                                                                                                                   #
#                                                                                                                                                   #
#                                                                                                                                                   #
#####################################################################################################################################################
Function MapDrive {
    
    If ($MapDrive -eq $DriveList[0]){
    net use m:  \\hca.uk.net\DGLDATA\P1
    ii M:\pm}
    
    ElseIf ($MapDrive -eq $DriveList[1]){
    net use m:  \\hca.uk.net\DGLDATA\DGLFSG3
    ii M:\pm}

    ElseIf($MapDrive -eq $DriveList[2]){
    net use m:  \\hca.uk.net\DGLDATA\P3
    ii M:\pm}

    ElseIf($MapDrive -eq $DriveList[3]){
    net use m:  \\hca.uk.net\DGLDATA\P4
    ii M:\pm}

    ElseIf($MapDrive -eq $DriveList[4]){
    net use m:  \\hca.uk.net\DGLDATA\P5
    ii M:\pm}

    ElseIf($MapDrive -eq $DriveList[5]){
    net use m:  \\hca.uk.net\DGLDATA\P6
    ii M:\pm}

    ElseIf($MapDrive -eq $DriveList[6]){
    net use m:  \\hca.uk.net\DGLDATA\P7
    ii M:\pm}

    ElseIf($MapDrive -eq $DriveList[7]){
    net use m:  \\hca.uk.net\DGLDATA\P8
    ii M:\pm}

    ElseIf($MapDrive -eq $DriveList[8]){
    net use m:  \\hca.uk.net\DGLDATA\P9
    ii M:\pm}

    ElseIf($MapDrive -eq $DriveList[9]){
    net use m:  \\hca.uk.net\DGLDATA\P10
    ii M:\pm}

    ElseIf($MapDrive -eq $DriveList[10]){
    net use m:  \\hca.uk.net\DGLDATA\P11
    ii M:\pm}

    ElseIf($MapDrive -eq $DriveList[11]){
    net use m:  \\hca.uk.net\DGLDATA\P12
    ii M:\pm}
}
    net use M: /d
    #Define Drive Selector Main Form
    Add-Type -AssemblyName System.Windows.Forms
    $DGL = New-Object system.Windows.Forms.Form 
    $DGL.Text = "DGL Practice Manager"
    $DGL.TopMost = $true
    $DGL.BackgroundImage = [system.drawing.image]::FromFile("C:\Users\aburton\Desktop\Practice Selector\Images\medical.jpg")
    $DGL.Icon = New-Object system.drawing.icon("C:\Users\aburton\Desktop\Practice Selector\Images\medical2.ico")
    $DGL.Width = 600
    $DGL.Height = 265
    $DGL.MinimizeBox = $False
    $DGL.MaximizeBox = $False
    $DGL.BorderStyle = System.WinForms.FormBorderStyle.FixedSingle

    #Label to Display Instuctions
    $label2 = New-Object system.windows.Forms.Label 
    $label2.Text = "Select which drive"
    $label2.BackColor = "#e4f3fa"
    $label2.AutoSize = $true
    $label2.Width = 25
    $label2.Height = 10
    $label2.location = new-object system.drawing.point(20,28)
    $label2.Font = "Microsoft Sans Serif,10"
    $DGL.controls.Add($label2) 

    #Dropdown Box For Selecting Practice
    $Dropdown = New-Object system.windows.Forms.ComboBox 
    $Dropdown.BackColor = "#e4f3fa"
    $DropDown.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
    $Dropdown.Width = 243
    $Dropdown.Height = 20
    $Dropdown.location = new-object system.drawing.point(21,73)
    $Dropdown.Font = "Microsoft Sans Serif,10"
    $DropDown.items.addrange($DriveList)
    $dropdown.SelectedIndex=0
    $DGL.controls.Add($Dropdown) 

    #Cancel Button to Cancel drive Selection
    $Cancelbutton = New-Object system.windows.Forms.Button 
    $Cancelbutton.Text = "Cancel"
    $Cancelbutton.Width = 60
    $Cancelbutton.Height = 30
    $Cancelbutton.location = new-object system.drawing.point(210,120)
    $Cancelbutton.Font = "Microsoft Sans Serif,10"
    $DGL.CancelButton = $Cancelbutton
    $CancelButton.Add_Click({ $DGL.close();[System.Windows.Forms.Application]::Exit($null)})
    $DGL.controls.Add($Cancelbutton) 

    #OK Button to Select Drive
    $OKbutton = New-Object system.windows.Forms.Button 
    $OKbutton.Text = "OK"
    $OKbutton.Width = 60
    $OKbutton.Height = 30
    $OKbutton.location = new-object system.drawing.point(140,120)
    $OKbutton.Font = "Microsoft Sans Serif,10"
    $DGL.AcceptButton = $OKbutton
    $OKbutton.Add_Click({$MapDrive = $Dropdown.SelectedItem.ToString() ; MapDrive ; $DGL.close()})
	$DGL.controls.Add($OKbutton) 

    #Display the Form
	$DGL.Add_Shown({$DGL.Activate()})
	$DGL.ShowDialog()
