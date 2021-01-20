#Bibli
Add-Type -assembly System.Windows.Forms

###########
# Functions
###########

function get-time {
    [CmdletBinding()]
    Param ()

    Begin
    {
        # Gather of starting and finishing time of each day
        $MondayStart = $MonStartHour.SelectedItem.ToString() + ":" + $MonStartMin.SelectedItem.ToString()
        $MondayFinish = $MonFinishHour.SelectedItem.ToString() + ":" + $MonFinishMin.SelectedItem.ToString()

        $TuesdayStart = $TueStartHour.SelectedItem.ToString() + ":" + $TueStartMin.SelectedItem.ToString()
        $TuesdayFinish = $TueFinishHour.SelectedItem.ToString() + ":" + $TueFinishMin.SelectedItem.ToString()
    
        $WednesdayStart = $WedStartHour.SelectedItem.ToString() + ":" + $WedStartMin.SelectedItem.ToString()
        $WednesdayFinish = $WedFinishHour.SelectedItem.ToString() + ":" + $WedFinishMin.SelectedItem.ToString()
    
        $ThursdayStart = $ThuStartHour.SelectedItem.ToString() + ":" + $ThuStartMin.SelectedItem.ToString()
        $ThursdayFinish = $ThuFinishHour.SelectedItem.ToString() + ":" + $ThuFinishMin.SelectedItem.ToString()
    
        $FridayStart = $FriStartHour.SelectedItem.ToString() + ":" + $FriStartMin.SelectedItem.ToString()
        $FridayFinish = $FriFinishHour.SelectedItem.ToString() + ":" + $FriFinishMin.SelectedItem.ToString()

        $SaturdayStart = $SatStartHour.SelectedItem.ToString() + ":" + $SatStartMin.SelectedItem.ToString()
        $SaturdayFinish = $SatFinishHour.SelectedItem.ToString() + ":" + $SatFinishMin.SelectedItem.ToString()

        $SundayStart = $SunStartHour.SelectedItem.ToString() + ":" + $SunStartMin.SelectedItem.ToString()
        $SundayFinish = $SunFinishHour.SelectedItem.ToString() + ":" + $SunFinishMin.SelectedItem.ToString()
    
        
    }
    Process
    {
        $Monday = New-TimeSpan -Start $MondayStart -End $MondayFinish
        $Tuesday = New-TimeSpan -Start $TuesdayStart -End $TuesdayFinish
        $Wednesday = New-TimeSpan -Start $WednesdayStart -End $WednesdayFinish
        $Thursday = New-TimeSpan -Start $ThursdayStart -End $ThursdayFinish
        $Friday = New-TimeSpan -Start $FridayStart -End $FridayFinish
        $Saturday = New-TimeSpan -Start $SaturdayStart -End $SaturdayFinish
        $Sunday = New-TimeSpan -Start $SundayStart -End $SundayFinish

        $Total = $Monday + $Tuesday + $Wednesday + $Thursday + $Friday + $Saturday + $Sunday
        write-host $Total
        
    }
    End
    {
        $Resulthours = $Total.Days * 24 + $Total.Hours
        $Resultminutes = $Total.minutes
        $Result.Text = $Resulthours.ToString() + ":" + $Resultminutes.ToString()
        
    }
    
}


#parameters of the main window
$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='Calculette horaires / semaine'
$main_form.Width = 800
$main_form.Height = 400
$main_form.AutoSize = $true

# Display of the starting hours
$Debut = New-Object System.Windows.Forms.Label
$Debut.Text = "heure de début d'accueil"
$Debut.Location = New-Object System.Drawing.Point(80,10)
$Debut.AutoSize = $true
$main_form.Controls.Add($Debut)

# Display of the Finishing hours
$Fin = New-Object System.Windows.Forms.Label
$Fin.Text = "Heure de fin d'accueil"
$Fin.Location = New-Object System.Drawing.Point(300,10)
$Fin.AutoSize = $true
$main_form.Controls.Add($Fin)

# Display of the Monday line
$Lundi = New-Object System.Windows.Forms.Label
$Lundi.Text = "Lundi"
$Lundi.Location = New-Object System.Drawing.Point(10,50)
$Lundi.AutoSize = $true
$main_form.Controls.Add($Lundi)

#Display of the Tuesday line
$Mardi = New-Object System.Windows.Forms.Label
$Mardi.Text = "Mardi"
$Mardi.Location = New-Object System.Drawing.Point(10,90)
$Mardi.AutoSize = $true
$main_form.Controls.Add($Mardi)

#Display of the wednesday line
$Mercredi = New-Object System.Windows.Forms.Label
$Mercredi.Text = "Mercredi"
$Mercredi.Location = New-Object System.Drawing.Point(10,130)
$Mercredi.AutoSize = $true
$main_form.Controls.Add($Mercredi)

#Display of the Thursday line
$Jeudi = New-Object System.Windows.Forms.Label
$Jeudi.Text = "Jeudi"
$Jeudi.Location = New-Object System.Drawing.Point(10,170)
$Jeudi.AutoSize = $true
$main_form.Controls.Add($Jeudi)

# Display of the Friday line
$Vendredi = New-Object System.Windows.Forms.Label
$Vendredi.Text = "Vendredi"
$Vendredi.Location = New-Object System.Drawing.Point(10,210)
$Vendredi.AutoSize = $true
$main_form.Controls.Add($Vendredi)

#Display of the Saturday line
$Samedi = New-Object System.Windows.Forms.Label
$Samedi.Text = "Samedi"
$Samedi.Location = New-Object System.Drawing.Point(10,250)
$Samedi.AutoSize = $true
$main_form.Controls.Add($Samedi)

#Display of the Sunday line
$Dimanche = New-Object System.Windows.Forms.Label
$Dimanche.Text = "Dimanche"
$Dimanche.Location = New-Object System.Drawing.Point(10,290)
$Dimanche.AutoSize = $true
$main_form.Controls.Add($Dimanche)

# combobox for Monday starting hour
$MonStartHour = New-Object System.Windows.Forms.ComboBox
$MonStartHour.Text = "heure"
$MonStartHour.Location = New-Object System.Drawing.Point(80,50)
$MonStartHour.Size = New-Object System.Drawing.Size(40,8)
$MonStartHour.Width = 50
$MonStartHour.AutoSize = $true
for ($i = 0; $i -lt 25; $i++) {
    $MonStartHour.Items.Add($i);
}
$MonStartHour.SelectedIndex = 0
$main_form.Controls.Add($MonStartHour)

# combobox for Monday starting minutes
$MonStartMin = New-Object System.Windows.Forms.ComboBox
$MonStartMin.Text = "minutes"
$MonStartMin.Location = New-Object System.Drawing.Point(150,50)
$MonStartMin.Size = New-Object System.Drawing.Size(40,8)
$MonStartMin.Width = 50
$MonStartMin.AutoSize = $true
for ($i = 0; $i -lt 60; $i=$i+5) {
    $MonStartMin.Items.Add($i);
}
$MonStartMin.SelectedIndex = 0
$main_form.Controls.Add($MonStartMin)

# combobox for Monday finishing hour
$MonFinishHour = New-Object System.Windows.Forms.ComboBox
$MonFinishHour.Text = "heure"
$MonFinishHour.Location = New-Object System.Drawing.Point(300,50)
$MonFinishHour.Size = New-Object System.Drawing.Size(40,8)
$MonFinishHour.Width = 50
$MonFinishHour.AutoSize = $true
for ($i = 0; $i -lt 25; $i++) {
    $MonFinishHour.Items.Add($i);
}
$MonFinishHour.SelectedIndex = 0
$main_form.Controls.Add($MonFinishHour)

# combobox for Monday finishing minutes
$MonFinishMin = New-Object System.Windows.Forms.ComboBox
$MonFinishMin.Text = "minutes"
$MonFinishMin.Location = New-Object System.Drawing.Point(370,50)
$MonFinishMin.Size = New-Object System.Drawing.Size(40,8)
$MonFinishMin.Width = 50
$MonFinishMin.AutoSize = $true
for ($i = 0; $i -lt 60; $i=$i+5) {
    $MonFinishMin.Items.Add($i);    
}
$MonFinishMin.SelectedIndex = 0
$main_form.Controls.Add($MonFinishMin)

# combobox for Tuesday starting hour
$TueStartHour = New-Object System.Windows.Forms.ComboBox
$TueStartHour.Text = "heure"
$TueStartHour.Location = New-Object System.Drawing.Point(80,90)
$TueStartHour.Size = New-Object System.Drawing.Size(40,8)
$TueStartHour.Width = 50
$TueStartHour.AutoSize = $true
for ($i = 0; $i -lt 25; $i++) {
    $TueStartHour.Items.Add($i);
}
$TueStartHour.SelectedIndex = 0
$main_form.Controls.Add($TueStartHour)

# combobox for Tuesday starting minutes
$TueStartMin = New-Object System.Windows.Forms.ComboBox
$TueStartMin.Text = "minutes"
$TueStartMin.Location = New-Object System.Drawing.Point(150,90)
$TueStartMin.Size = New-Object System.Drawing.Size(40,8)
$TueStartMin.Width = 50
$TueStartMin.AutoSize = $true
for ($i = 0; $i -lt 60; $i=$i+5) {
    $TueStartMin.Items.Add($i);
}
$TueStartMin.SelectedIndex = 0
$main_form.Controls.Add($TueStartMin)

# combobox for Tuesday finishing hour
$TueFinishHour = New-Object System.Windows.Forms.ComboBox
$TueFinishHour.Text = "heure"
$TueFinishHour.Location = New-Object System.Drawing.Point(300,90)
$TueFinishHour.Size = New-Object System.Drawing.Size(40,8)
$TueFinishHour.Width = 50
$TueFinishHour.AutoSize = $true
for ($i = 0; $i -lt 25; $i++) {
    $TueFinishHour.Items.Add($i);
}
$TueFinishHour.SelectedIndex = 0
$main_form.Controls.Add($TueFinishHour)

# combobox for Tuesday finishing minutes
$TueFinishMin = New-Object System.Windows.Forms.ComboBox
$TueFinishMin.Text = "minutes"
$TueFinishMin.Location = New-Object System.Drawing.Point(370,90)
$TueFinishMin.Size = New-Object System.Drawing.Size(40,8)
$TueFinishMin.Width = 50
$TueFinishMin.AutoSize = $true
for ($i = 0; $i -lt 60; $i=$i+5) {
    $TueFinishMin.Items.Add($i);    
}
$TueFinishMin.SelectedIndex = 0
$main_form.Controls.Add($TueFinishMin)

# combobox for Wednesday starting hour
$WedStartHour = New-Object System.Windows.Forms.ComboBox
$WedStartHour.Text = "heure"
$WedStartHour.Location = New-Object System.Drawing.Point(80,130)
$WedStartHour.Size = New-Object System.Drawing.Size(40,8)
$WedStartHour.Width = 50
$WedStartHour.AutoSize = $true
for ($i = 0; $i -lt 25; $i++) {
    $WedStartHour.Items.Add($i);
}
$WedStartHour.SelectedIndex = 0
$main_form.Controls.Add($WedStartHour)

# combobox for Wednesday starting minutes
$WedStartMin = New-Object System.Windows.Forms.ComboBox
$WedStartMin.Text = "minutes"
$WedStartMin.Location = New-Object System.Drawing.Point(150,130)
$WedStartMin.Size = New-Object System.Drawing.Size(40,8)
$WedStartMin.Width = 50
$WedStartMin.AutoSize = $true
for ($i = 0; $i -lt 60; $i=$i+5) {
    $WedStartMin.Items.Add($i);
}
$WedStartMin.SelectedIndex = 0
$main_form.Controls.Add($WedStartMin)

# combobox for Wednesday finishing hour
$WedFinishHour = New-Object System.Windows.Forms.ComboBox
$WedFinishHour.Text = "heure"
$WedFinishHour.Location = New-Object System.Drawing.Point(300,130)
$WedFinishHour.Size = New-Object System.Drawing.Size(40,8)
$WedFinishHour.Width = 50
$WedFinishHour.AutoSize = $true
for ($i = 0; $i -lt 25; $i++) {
    $WedFinishHour.Items.Add($i);
}
$WedFinishHour.SelectedIndex = 0
$main_form.Controls.Add($WedFinishHour)

# combobox for Wednesday finishing minutes
$WedFinishMin = New-Object System.Windows.Forms.ComboBox
$WedFinishMin.Text = "minutes"
$WedFinishMin.Location = New-Object System.Drawing.Point(370,130)
$WedFinishMin.Size = New-Object System.Drawing.Size(40,8)
$WedFinishMin.Width = 50
$WedFinishMin.AutoSize = $true
for ($i = 0; $i -lt 60; $i=$i+5) {
    $WedFinishMin.Items.Add($i);    
}
$WedFinishMin.SelectedIndex = 0
$main_form.Controls.Add($WedFinishMin)

# combobox for Thuday starting hour
$ThuStartHour = New-Object System.Windows.Forms.ComboBox
$ThuStartHour.Text = "heure"
$ThuStartHour.Location = New-Object System.Drawing.Point(80,170)
$ThuStartHour.Size = New-Object System.Drawing.Size(40,8)
$ThuStartHour.Width = 50
$ThuStartHour.AutoSize = $true
for ($i = 0; $i -lt 25; $i++) {
    $ThuStartHour.Items.Add($i);
}
$ThuStartHour.SelectedIndex = 0
$main_form.Controls.Add($ThuStartHour)

# combobox for Thuday starting minutes
$ThuStartMin = New-Object System.Windows.Forms.ComboBox
$ThuStartMin.Text = "minutes"
$ThuStartMin.Location = New-Object System.Drawing.Point(150,170)
$ThuStartMin.Size = New-Object System.Drawing.Size(40,8)
$ThuStartMin.Width = 50
$ThuStartMin.AutoSize = $true
for ($i = 0; $i -lt 60; $i=$i+5) {
    $ThuStartMin.Items.Add($i);
}
$ThuStartMin.SelectedIndex = 0
$main_form.Controls.Add($ThuStartMin)

# combobox for Thuday finishing hour
$ThuFinishHour = New-Object System.Windows.Forms.ComboBox
$ThuFinishHour.Text = "heure"
$ThuFinishHour.Location = New-Object System.Drawing.Point(300,170)
$ThuFinishHour.Size = New-Object System.Drawing.Size(40,8)
$ThuFinishHour.Width = 50
$ThuFinishHour.AutoSize = $true
for ($i = 0; $i -lt 25; $i++) {
    $ThuFinishHour.Items.Add($i);
}
$ThuFinishHour.SelectedIndex = 0
$main_form.Controls.Add($ThuFinishHour)

# combobox for Thuday finishing minutes
$ThuFinishMin = New-Object System.Windows.Forms.ComboBox
$ThuFinishMin.Text = "minutes"
$ThuFinishMin.Location = New-Object System.Drawing.Point(370,170)
$ThuFinishMin.Size = New-Object System.Drawing.Size(40,8)
$ThuFinishMin.Width = 50
$ThuFinishMin.AutoSize = $true
for ($i = 0; $i -lt 60; $i=$i+5) {
    $ThuFinishMin.Items.Add($i);    
}
$ThuFinishMin.SelectedIndex = 0
$main_form.Controls.Add($ThuFinishMin)

# combobox for Friday starting hour
$FriStartHour = New-Object System.Windows.Forms.ComboBox
$FriStartHour.Text = "heure"
$FriStartHour.Location = New-Object System.Drawing.Point(80,210)
$FriStartHour.Size = New-Object System.Drawing.Size(40,8)
$FriStartHour.Width = 50
$FriStartHour.AutoSize = $true
for ($i = 0; $i -lt 25; $i++) {
    $FriStartHour.Items.Add($i);
}
$FriStartHour.SelectedIndex = 0
$main_form.Controls.Add($FriStartHour)

# combobox for Friday starting minutes
$FriStartMin = New-Object System.Windows.Forms.ComboBox
$FriStartMin.Text = "minutes"
$FriStartMin.Location = New-Object System.Drawing.Point(150,210)
$FriStartMin.Size = New-Object System.Drawing.Size(40,8)
$FriStartMin.Width = 50
$FriStartMin.AutoSize = $true
for ($i = 0; $i -lt 60; $i=$i+5) {
    $FriStartMin.Items.Add($i);
}
$FriStartMin.SelectedIndex = 0
$main_form.Controls.Add($FriStartMin)

# combobox for Friday finishing hour
$FriFinishHour = New-Object System.Windows.Forms.ComboBox
$FriFinishHour.Text = "heure"
$FriFinishHour.Location = New-Object System.Drawing.Point(300,210)
$FriFinishHour.Size = New-Object System.Drawing.Size(40,8)
$FriFinishHour.Width = 50
$FriFinishHour.AutoSize = $true
for ($i = 0; $i -lt 25; $i++) {
    $FriFinishHour.Items.Add($i);
}
$FriFinishHour.SelectedIndex = 0
$main_form.Controls.Add($FriFinishHour)

# combobox for Friday finishing minutes
$FriFinishMin = New-Object System.Windows.Forms.ComboBox
$FriFinishMin.Text = "minutes"
$FriFinishMin.Location = New-Object System.Drawing.Point(370,210)
$FriFinishMin.Size = New-Object System.Drawing.Size(40,8)
$FriFinishMin.Width = 50
$FriFinishMin.AutoSize = $true
for ($i = 0; $i -lt 60; $i=$i+5) {
    $FriFinishMin.Items.Add($i);    
}
$FriFinishMin.SelectedIndex = 0
$main_form.Controls.Add($FriFinishMin)

# combobox for Saturday starting hour
$SatStartHour = New-Object System.Windows.Forms.ComboBox
$SatStartHour.Text = "heure"
$SatStartHour.Location = New-Object System.Drawing.Point(80,250)
$SatStartHour.Size = New-Object System.Drawing.Size(40,8)
$SatStartHour.Width = 50
$SatStartHour.AutoSize = $true
for ($i = 0; $i -lt 25; $i++) {
    $SatStartHour.Items.Add($i);
}
$SatStartHour.SelectedIndex = 0
$main_form.Controls.Add($SatStartHour)

# combobox for Saturday starting minutes
$SatStartMin = New-Object System.Windows.Forms.ComboBox
$SatStartMin.Text = "minutes"
$SatStartMin.Location = New-Object System.Drawing.Point(150,250)
$SatStartMin.Size = New-Object System.Drawing.Size(40,8)
$SatStartMin.Width = 50
$SatStartMin.AutoSize = $true
for ($i = 0; $i -lt 60; $i=$i+5) {
    $SatStartMin.Items.Add($i);
}
$SatStartMin.SelectedIndex = 0
$main_form.Controls.Add($SatStartMin)

# combobox for Saturday finishing hour
$SatFinishHour = New-Object System.Windows.Forms.ComboBox
$SatFinishHour.Text = "heure"
$SatFinishHour.Location = New-Object System.Drawing.Point(300,250)
$SatFinishHour.Size = New-Object System.Drawing.Size(40,8)
$SatFinishHour.Width = 50
$SatFinishHour.AutoSize = $true
for ($i = 0; $i -lt 25; $i++) {
    $SatFinishHour.Items.Add($i);
}
$SatFinishHour.SelectedIndex = 0
$main_form.Controls.Add($SatFinishHour)

# combobox for Saturday finishing minutes
$SatFinishMin = New-Object System.Windows.Forms.ComboBox
$SatFinishMin.Text = "minutes"
$SatFinishMin.Location = New-Object System.Drawing.Point(370,250)
$SatFinishMin.Size = New-Object System.Drawing.Size(40,8)
$SatFinishMin.Width = 50
$SatFinishMin.AutoSize = $true
for ($i = 0; $i -lt 60; $i=$i+5) {
    $SatFinishMin.Items.Add($i);    
}
$SatFinishMin.SelectedIndex = 0
$main_form.Controls.Add($SatFinishMin)

# combobox for Sunday starting hour
$SunStartHour = New-Object System.Windows.Forms.ComboBox
$SunStartHour.Text = "heure"
$SunStartHour.Location = New-Object System.Drawing.Point(80,290)
$SunStartHour.Size = New-Object System.Drawing.Size(40,8)
$SunStartHour.Width = 50
$SunStartHour.AutoSize = $true
for ($i = 0; $i -lt 25; $i++) {
    $SunStartHour.Items.Add($i);
}
$SunStartHour.SelectedIndex = 0
$main_form.Controls.Add($SunStartHour)

# combobox for Sunday starting minutes
$SunStartMin = New-Object System.Windows.Forms.ComboBox
$SunStartMin.Text = "minutes"
$SunStartMin.Location = New-Object System.Drawing.Point(150,290)
$SunStartMin.Size = New-Object System.Drawing.Size(40,8)
$SunStartMin.Width = 50
$SunStartMin.AutoSize = $true
for ($i = 0; $i -lt 60; $i=$i+5) {
    $SunStartMin.Items.Add($i);
}
$SunStartMin.SelectedIndex = 0
$main_form.Controls.Add($SunStartMin)

# combobox for Sunday finishing hour
$SunFinishHour = New-Object System.Windows.Forms.ComboBox
$SunFinishHour.Text = "heure"
$SunFinishHour.Location = New-Object System.Drawing.Point(300,290)
$SunFinishHour.Size = New-Object System.Drawing.Size(40,8)
$SunFinishHour.Width = 50
$SunFinishHour.AutoSize = $true
for ($i = 0; $i -lt 25; $i++) {
    $SunFinishHour.Items.Add($i);
}
$SunFinishHour.SelectedIndex = 0
$main_form.Controls.Add($SunFinishHour)

# combobox for Sunday finishing minutes
$SunFinishMin = New-Object System.Windows.Forms.ComboBox
$SunFinishMin.Text = "minutes"
$SunFinishMin.Location = New-Object System.Drawing.Point(370,290)
$SunFinishMin.Size = New-Object System.Drawing.Size(40,8)
$SunFinishMin.Width = 50
$SunFinishMin.AutoSize = $true
for ($i = 0; $i -lt 60; $i=$i+5) {
    $SunFinishMin.Items.Add($i);    
}
$SunFinishMin.SelectedIndex = 0
$main_form.Controls.Add($SunFinishMin)

# Résultat
$Result = New-Object System.Windows.Forms.Label
$Result.Text = ""
$Result.Location = New-Object System.Drawing.Point (550,100)
$Result.AutoSize = $true
$main_form.Controls.Add($Result)

#calc button
$Bouton = New-Object System.Windows.Forms.Button
$Bouton.Location = New-Object System.Drawing.Size (550,50)
$Bouton.Size = New-Object System.Drawing.Size(120,23)
$Bouton.Text = "Calcul"
$main_form.Controls.Add($Bouton)

# Click action on button
$Bouton.Add_Click( 
    { 
        get-time
    }
)


# Display of the window
$main_form.ShowDialog()

