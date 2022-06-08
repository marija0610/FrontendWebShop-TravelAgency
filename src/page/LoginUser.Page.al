page 50314 "Login User"
{
    Caption = 'Login User';
    PageType = Card;
    SourceTable = Login;
    ApplicationArea = ALL;
    UsageCategory = Lists;
    SourceTableTemporary = true;
    DataCaptionExpression = Rec.Name;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("User Name"; Rec."User Name")
                {
                    ToolTip = 'Specifies the value of the User Name field.';
                    ApplicationArea = All;
                }

                field("Password"; Rec.Password)
                {
                    ToolTip = 'Specifies the value of the Password field.';
                    ApplicationArea = All;
                    ExtendedDatatype = Masked;
                }
            }
        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        LoginManagement: Codeunit "Login Management";
    begin
        if CloseAction <> Action::LookupCancel then
            if not LoginManagement.CheckPassword(Rec."User Name", Rec.Password) then
                Error('Incorrect password!');

        Rec.Password := '';
        Rec.Modify();
        exit(true);
    end;
}
