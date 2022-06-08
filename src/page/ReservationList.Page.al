page 50313 "Reservation List"
{
    ApplicationArea = All;
    Caption = 'Reservation List';
    PageType = List;
    SourceTable = Reservation;
    UsageCategory = Lists;
    CardPageId = "Reservation Card";

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
                field("Arrangement No."; Rec."Arrangement No.")
                {
                    ToolTip = 'Specifies the value of the Arrangement No. field.';
                    ApplicationArea = All;
                }
                field("Hotel No."; Rec."Hotel No.")
                {
                    ToolTip = 'Specifies the value of the Hotel No. field.';
                    ApplicationArea = All;
                }
                field("Hotel Name"; Rec."Hotel Name")
                {
                    ToolTip = 'Specifies the value of the Hotel Name field.';
                    ApplicationArea = All;
                }
                field("Hotel Address"; Rec."Hotel Address")
                {
                    ToolTip = 'Specifies the value of the Hotel Address field.';
                    ApplicationArea = All;
                }
                field(Destination; Rec.Destination)
                {
                    ToolTip = 'Specifies the value of the Destination field.';
                    ApplicationArea = All;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ToolTip = 'Specifies the value of the Starting Date field.';
                    ApplicationArea = All;
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ToolTip = 'Specifies the value of the Ending Date field.';
                    ApplicationArea = All;
                }
                field("Room Type"; Rec."Room Type")
                {
                    ToolTip = 'Specifies the value of the Room Type field.';
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.';
                    ApplicationArea = All;
                }
                field("Total Price"; Rec."Total Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
