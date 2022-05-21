page 50310 "Hotel List"
{
    ApplicationArea = All;
    Caption = 'Hotel List';
    PageType = List;
    SourceTable = Hotel;
    UsageCategory = Lists;
    CardPageId = "Hotel Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.';
                    ApplicationArea = All;
                }
                field("Destination No."; Rec."Destination No.")
                {
                    ToolTip = 'Specifies the value of the Destination No. field.';
                    ApplicationArea = All;
                }
                field("No. of single rooms"; Rec."No. of single rooms")
                {
                    ToolTip = 'Specifies the value of the No. of single rooms field.';
                    ApplicationArea = All;
                }
                field("No. of double rooms"; Rec."No. of double rooms")
                {
                    ToolTip = 'Specifies the value of the No. of double rooms field.';
                    ApplicationArea = All;
                }
                field("No. of triple rooms"; Rec."No. of triple rooms")
                {
                    ToolTip = 'Specifies the value of the No. of triple rooms field.';
                    ApplicationArea = All;
                }
                field("No. of quad rooms"; Rec."No. of quad rooms")
                {
                    ToolTip = 'Specifies the value of the No. of quad rooms field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
