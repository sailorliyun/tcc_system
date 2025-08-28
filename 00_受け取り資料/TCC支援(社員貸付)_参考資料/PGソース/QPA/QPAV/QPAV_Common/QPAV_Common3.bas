Attribute VB_Name = "QPAV_Common3"
Public Function Chk_txt(t_box As TextBox) As Boolean
'*****************************************************************************************
'   Textの入力チェック
'*****************************************************************************************
    Chk_txt = False
    
    If Trim(t_box.Text) = "" Then
        t_box.BackColor = vbRed
        t_box.SetFocus
        Exit Function
    End If
    
    Chk_txt = True
End Function

Public Function Chk_lentxt1(t_box As TextBox, t_len As Integer) As Boolean
'*****************************************************************************************
'   Textの桁数オーバーチェック
'*****************************************************************************************
    Chk_lentxt1 = False
    
''    If Len(Trim(t_box.Text)) > t_len Then                         '【Win2000対応】Del by Yokoyama@NBC 2004/07/20
    If LenB(StrConv(Trim(t_box.Text), vbFromUnicode)) > t_len Then  '【Win2000対応】Add by Yokoyama@NBC 2004/07/20
        t_box.BackColor = vbRed
        t_box.SetFocus
        Exit Function
    End If
    
    Chk_lentxt1 = True
End Function

Public Function Chk_lentxt2(t_box As TextBox, t_len As Integer) As Boolean
'*****************************************************************************************
'   Textの桁数固定チェック
'*****************************************************************************************
    Chk_lentxt2 = False
    
    If Len(Trim(t_box.Text)) <> t_len Then
        t_box.BackColor = vbRed
        t_box.SetFocus
        Exit Function
    End If
    
    Chk_lentxt2 = True
End Function

