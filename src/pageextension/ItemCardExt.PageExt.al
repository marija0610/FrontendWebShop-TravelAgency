pageextension 50300 "Item Card Ext" extends "Item Card"
{
    //Editable = false;

    layout
    {
        modify(InventoryGrp) { Visible = false; }
        modify(Replenishment) { Visible = false; }
        modify(Planning) { Visible = false; }
        modify(Warehouse) { Visible = false; }
        modify(ItemTracking) { Visible = false; }
        modify(GTIN) { Visible = false; }
        modify("Service Item Group") { Visible = false; }
        modify("Automatic Ext. Texts") { Visible = false; }
        modify("Common Item No.") { Visible = false; }
        modify("Purchasing Code") { Visible = false; }
        modify(ForeignTrade) { Visible = false; }
        modify("Costs & Posting") { Visible = false; }
        modify("Price Includes VAT") { Visible = false; }
        modify("Price/Profit Calculation") { Visible = false; }
        modify("Profit %") { Visible = false; }
        modify("Allow Invoice Disc.") { Visible = false; }
        modify("Item Disc. Group") { Visible = false; }
        modify("Sales Blocked") { Visible = false; }
        modify("VAT Bus. Posting Gr. (Price)") { Visible = false; }
        modify("Prices & Sales") { Visible = false; }
        modify(ItemAttributesFactbox) { Visible = false; }
        modify("Attached Documents") { Visible = false; }

        addafter(Description)
        {
            field("Hotel No."; Rec."Hotel No.")
            {
                ApplicationArea = All;
                ToolTip = 'Displays Hotel No.';
            }

            field("Hotel Name"; Rec."Hotel Name")
            {
                ApplicationArea = All;
                ToolTip = 'Displays Hotel Name';
            }

            field("Hotel Address"; Rec."Hotel Address")
            {
                ApplicationArea = All;
                ToolTip = 'Displays Hotel Address';
            }

            field("City"; Rec.City)
            {
                ApplicationArea = All;
                ToolTip = 'Displays Destination Name';
            }

            field("Country"; Rec.Country)
            {
                ApplicationArea = All;
                ToolTip = 'Displays Destination Name';
            }
        }

    }
    actions
    {

        addafter(ItemActionGroup)
        {
            action(CreateReservation)
            {
                Caption = 'Create reservation';
                ApplicationArea = All;
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Reservation: Record Reservation;
                    Customer: Record Customer;
                    LoginManagement: Codeunit "Login Management";
                begin
                    Reservation.Init();
                    Customer.SetRange(Username, LoginManagement.GetCurrentLogin()."User Name");
                    if Customer.FindFirst() then begin
                        Reservation."Customer No." := Customer."No.";
                        Reservation."Customer Name" := Customer.Name;
                        Reservation."E-mail" := Customer."E-Mail";
                    end;

                    Reservation."Arrangement No." := Rec."No.";
                    Reservation."Hotel No." := Rec."Hotel No.";
                    Reservation."Hotel Name" := Rec."Hotel Name";
                    Reservation."Hotel Address" := Rec."Hotel Address";
                    Reservation.Destination := Rec.City + ', ' + Rec.Country;
                    Reservation.Insert(true);
                    Page.Run(50312, Reservation);
                end;
            }
        }
    }
    var
        myInt: Integer;

}