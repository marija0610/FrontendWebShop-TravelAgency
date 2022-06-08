page 50303 "Arrangements List Part"
{
    Caption = 'Arrangements List Part';
    PageType = ListPart;
    SourceTable = Item;
    Editable = false;
    CardPageId = "Item Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the item.';
                    ApplicationArea = Basic, Suite;
                }
                field("Hotel Name"; Rec."Hotel Name")
                {
                    ToolTip = 'Displays Hotel Name';
                    ApplicationArea = All;
                }
                field("Hotel Address"; Rec."Hotel Address")
                {
                    ToolTip = 'Displays Hotel Address';
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ToolTip = 'Displays City';
                    ApplicationArea = All;
                }
                field(Country; Rec.Country)
                {
                    ToolTip = 'Displays Country';
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnInit()
    begin
        Rec.SetRange("Item Category Code", 'ARRANGEMENT');
    end;
}
