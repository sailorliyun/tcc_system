Attribute VB_Name = "QPAV_Common1"
Option Explicit
Public gstrDat As String

'*********************************************************************************************
'*�@�@�֐����@�F�@���񂹏Ɖ�
'*�@�@���@���@�F�@�����P�i�O������ԍ��j
'*�@�@���@�ʁ@�F�@boolean (false���������ʂO���G���[�@ , true������j
'*�@�@�@�\�T�v�F�@���񂹏Ɖ��ʁiQSAV_ACTX010�j��call����
'*********************************************************************************************
Public Function gblnNayose(strKekkaKaiinNo As String) As Boolean
 Dim clsApp          As Object
 Dim lngKaiinShubetu As Long
 Dim strKigyou       As String
 Dim strSubRa        As String
 Dim strNaibu        As String
 Dim strGaibu        As String
    
    gblnNayose = False
    
    Set clsApp = CreateObject("QSAV_ActX0001.ActX001C")
    lngKaiinShubetu = 0
    
    Call clsApp.subQSAV_ActX001(lngKaiinShubetu, strKigyou, strSubRa _
                               , strNaibu, strGaibu, gstrCommandLine(2) _
                               , gstrCommandLine(5), gstrCommandLine(10) _
                               , gstrCommandLine(8), gstrCommandLine(3) _
                               , gstrCommandLine(4), gstrCommandLine(0))
    
    '
    If lngKaiinShubetu = -1 Then
'''       cmdPFK_Click (1)
       Exit Function
    End If
    
    '
    If lngKaiinShubetu = 0 Then
'''        txtKaiin1.SetFocus
        Exit Function
    End If
    
    '10�C16���������
    If Mid$(strGaibu, 1, 6) = "000000" Then
       strKekkaKaiinNo = Mid$(strGaibu, 7, 10)
    Else
       strKekkaKaiinNo = strGaibu
    End If
    
    gblnNayose = True
    
    Set clsApp = Nothing

End Function
