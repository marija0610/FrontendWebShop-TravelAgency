page 50304 "Login List"
{
    ApplicationArea = All;
    Caption = 'Login List';
    PageType = List;
    Editable = false;
    SourceTable = Login;
    UsageCategory = Administration;
    CardPageId = "Register User";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';

                }
                field("User Name"; Rec."User Name")
                {
                    ToolTip = 'Specifies the value of the User Name field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}