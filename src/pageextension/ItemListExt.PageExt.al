pageextension 50302 "Item List Ext" extends "Item List"
{
    Editable = false;

    layout
    {
        modify("Unit Price") { Visible = false; }
        modify("Base Unit of Measure") { Visible = false; }
    }


    actions
    {
        modify(Prices_Prices) { Visible = false; }
        modify(Prices_LineDiscounts) { Visible = false; }
        modify("Item Refe&rences") { Visible = false; }

        addbefore(Item)
        {

            group("&Line")
            {
                Caption = '&Line';
                Image = Line;

                action("Create Reservation")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Create Reservation';
                    Image = Add;
                    Promoted = true;
                    Scope = Repeater;

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
    }

    trigger OnOpenPage()
    begin
        Rec.SetRange("Item Category Code", 'ARRANGEMENT');
    end;
}


