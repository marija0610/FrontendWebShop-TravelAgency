page 50318 "Customers Reservations"
{
    Caption = 'Customers Reservations';
    PageType = ListPart;
    SourceTable = Reservation;
    Editable = false;
    SourceTableView = sorting("Starting Date") order(descending);

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Hotel Name"; Rec."Hotel Name")
                {
                    ToolTip = 'Specifies the value of the Hotel Name field.';
                    ApplicationArea = All;
                    StyleExpr = Style;
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
                    StyleExpr = Style;
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ToolTip = 'Specifies the value of the Ending Date field.';
                    ApplicationArea = All;
                    StyleExpr = Style;
                }
                field("Room Type"; Rec."Room Type")
                {
                    ToolTip = 'Specifies the value of the Room Type field.';
                    ApplicationArea = All;
                }
                field("Total Price"; Rec."Total Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.';
                    ApplicationArea = All;
                }
                // field("Payment method"; Rec."Payment method")
                // {
                //     ToolTip = 'Specifies the value of the Payment method field.';
                //     ApplicationArea = All;
                //     Visible = false;
                // }
            }
        }
    }

    trigger OnOpenPage()
    var
        Customer: Record Customer;
        LoginManagement: Codeunit "Login Management";
    begin
        Customer.SetRange(Username, LoginManagement.GetCurrentLogin()."User Name");
        if Customer.FindFirst() then
            Rec.SetRange("Customer No.", Customer."No.");
    end;

    trigger OnAfterGetRecord()
    begin

        if (Rec."Starting Date" < Today()) and (Rec."Ending Date" < Today()) then
            Style := 'Unfavorable'
        else
            Style := 'Favorable';

        if (Rec."Ending Date" >= Today()) and (Rec."Starting Date" <= Today()) then
            Style := 'StrongAccent';
    end;

    var
        Style: Text;

}
