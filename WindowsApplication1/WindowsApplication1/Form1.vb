Imports System.IO
Imports System.Threading
Imports System.Environment
Public Class Form1
    Dim tempFolderPath As String = System.IO.Path.GetTempPath()
    Dim chromedir As String = GetFolderPath(SpecialFolder.ApplicationData) & "\Local\Google\Chrome\User Data\Default\"
    Dim chromedir2 As String = GetFolderPath(SpecialFolder.ApplicationData) & "\Local\Google\Chrome\User Data\Default\Cache\"
    Dim firefoxdir As String = GetFolderPath(SpecialFolder.ApplicationData) & "\Local\Mozilla\Firefox\Profiles\"
    Dim firefoxdir2 As String = GetFolderPath(SpecialFolder.ApplicationData) & "\Roaming\Mozilla\Firefox\Profiles\"
    Dim iedir As String = GetFolderPath(SpecialFolder.ApplicationData) & "\Roaming\Microsoft\Windows\Cookies\"
    Dim iedir2 As String = GetFolderPath(SpecialFolder.ApplicationData) & "\Local\Microsoft\Windows\History\"
    Dim opera As String = GetFolderPath(SpecialFolder.ApplicationData) & "\Local\Opera\Opera\"
    Dim safari As String = GetFolderPath(SpecialFolder.ApplicationData) & "\Local\Applec~1\Safari\"

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Button1.Enabled = False
        If tmp.Checked = True Then
            temporary()
        End If
        If ie.Checked = True Then
            internetexplorer()
        End If
        If fire.Checked = True Then
            mozilla()
        End If
        If chrome.Checked = True Then
            googlechrome()
        End If
        If apple.Checked = True Then
            safaribrowser()
        End If
        If ope.Checked = True Then
            operabrowser()
        End If
        Button1.Enabled = True
        logtext(TimeOfDay, "Job Finished")

    End Sub
#Region "Core"

    Function temporary()
        For Each filePath In Directory.GetFiles(tempFolderPath)
            Try
                File.Delete(filePath)
            Catch
            End Try
        Next
        logtext(TimeOfDay, "Temporary Files cleaned")
    End Function

    Function googlechrome()
        File.WriteAllText("chrome.bat", My.Resources.chromium)
        Process.Start("chrome.bat")
        Thread.Sleep(2500)
        File.Delete("chrome.bat")
        logtext(TimeOfDay, "Google Chrome trash files cleaned")
    End Function
    Function mozilla()
        File.WriteAllText("firefox.bat", My.Resources.firefoxium)
        Process.Start("firefox.bat")
        Thread.Sleep(2500)
        File.Delete("firefox.bat")
        logtext(TimeOfDay, "Mozilla Firefox trash files cleaned")
    End Function
    Function internetexplorer()

        Shell("cmd.exe /c del /q /s /f " & iedir)
        Shell("cmd.exe /c del /q /s /f " & iedir2)
        logtext(TimeOfDay, "Internet Explorer trash files cleaned")
    End Function
    Function operabrowser()

        Shell("cmd.exe /c del /q /s /f " & opera)
        logtext(TimeOfDay, "Opera trash files cleaned")
    End Function
    Function safaribrowser()

        Shell("cmd.exe /c del /q /s /f " & safari)
        logtext(TimeOfDay, "Safari trash files cleaned")
    End Function

#End Region

#Region "Logging"
    Function logtext(ByVal time As String, ByVal log As String)
        TextBox1.AppendText(String.Format("[" & time & "] " & log))
        TextBox1.AppendText(Environment.NewLine)
    End Function

#End Region

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load

    End Sub



End Class
