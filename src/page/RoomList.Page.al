page 50311 "Room List"
{
    ApplicationArea = All;
    Caption = 'Room List';
    PageType = List;
    SourceTable = Room;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Hotel Entry No."; Rec."Hotel Entry No.")
                {
                    ToolTip = 'Specifies the value of the Hotel Entry No. field.';
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("Type"; Rec.Type)
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
