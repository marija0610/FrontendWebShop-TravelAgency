page 50317 "Tracking Reservation List"
{
    ApplicationArea = All;
    Caption = 'Tracking Reservation List';
    PageType = List;
    SourceTable = "Tracking Reservations";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No field.';
                    ApplicationArea = All;
                }
                field("Hotel No."; Rec."Hotel No.")
                {
                    ToolTip = 'Specifies the value of the Hotel No. field.';
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.';
                    ApplicationArea = All;
                }
                field("Room No."; Rec."Room No.")
                {
                    ToolTip = 'Specifies the value of the Room No. field.';
                    ApplicationArea = All;
                }
                field("Room Type"; Rec."Room Type")
                {
                    ToolTip = 'Specifies the value of the Room Type field.';
                    ApplicationArea = All;
                }
                field("Reservation Date"; Rec."Reservation Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
