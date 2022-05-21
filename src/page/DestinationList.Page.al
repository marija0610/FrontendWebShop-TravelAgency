page 50307 "Destination List"
{
    ApplicationArea = All;
    Caption = 'Destination List';
    PageType = List;
    SourceTable = Destination;
    UsageCategory = Lists;
    CardPageId = "Destination Card";

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
                field(Country; Rec.Country)
                {
                    ToolTip = 'Specifies the value of the Country field.';
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the value of the City field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
