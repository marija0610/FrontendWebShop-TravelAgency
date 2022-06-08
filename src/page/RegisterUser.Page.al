page 50315 "Register User"
{
    Caption = 'Register User';
    PageType = StandardDialog;
    SourceTable = Login;
    ShowFilter = false;
    DataCaptionExpression = Rec.Name;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                    ApplicationArea = All;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ToolTip = 'Specifies the value of the E-Mail field.';
                    ApplicationArea = All;
                }

            }

            group(LogIn)
            {
                Caption = 'Log in';
                Editable = IsLookupPage;
                field("User Name"; Rec."User Name")
                {
                    ToolTip = 'Specifies the value of the User Name field.';
                    ApplicationArea = All;
                }
                field(Password; Rec.Password)
                {
                    ToolTip = 'Specifies the value of the Password field.';
                    ApplicationArea = All;
                }
            }

        }
    }


    trigger OnOpenPage()
    begin
        IsLookupPage := CurrPage.LookupMode();
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        LoginManagement: Codeunit "Login Management";
    begin
        if not ((rec."User Name" = '') or (rec.Password = '')) then
            if CurrPage.LookupMode() then begin
                TestData();
                LoginManagement.StorePassword(Rec."User Name", Rec.Password);
                Rec.Password := '';
            end;
    end;

    procedure TestData()
    begin
        Rec.TestField("User Name");
        Rec.TestField("Password");
        if StrLen(Rec.Password) < 8 then
            Error('Password must have at least 8 characters.');
    end;

    var
        IsLookupPage: Boolean;
}
