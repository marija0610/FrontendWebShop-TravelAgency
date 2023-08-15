pageextension 50300 "Item Card Ext" extends "Item Card"
{
    Caption = 'Hotel';
    PromotedActionCategories = 'New,Process,Report,Item,History,Prices & Discounts,Approve,Request Approval';

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
        modify(Blocked) { Visible = false; }

        modify("Item Category Code") { Visible = admin; }
        modify(Type) { Visible = admin; }
        modify("Base Unit of Measure") { Visible = admin; }
        modify(Description) { Editable = admin; }

        modify(Item)
        {
            Caption = 'Hotel';
        }

        addafter(Description)
        {
            field(Country; Rec.Country)
            {
                ApplicationArea = All;
                ToolTip = 'Displays Country Code';
            }
            field(City; Rec.City)
            {
                ApplicationArea = All;
                ToolTip = 'Displays City';
            }
            field("Hotel Address"; Rec."Hotel Address")
            {
                ApplicationArea = All;
                ToolTip = 'Displays Hotel Address';
            }
            // field("City"; Rec.City)
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Displays Destination Name';
            // }
            // field("Country"; Rec.Country)
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Displays Destination Name';
            // }
        }
        addafter(Item)
        {
            group("Hotel Rooms")
            {
                Visible = admin;
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
                    Visible = admin;
                }
                field("No. of quad rooms"; Rec."No. of quad rooms")
                {
                    ToolTip = 'Specifies the value of the No. of quad rooms field.';
                    ApplicationArea = All;
                }
            }
        }
        addafter("Hotel Rooms")
        {
            group(Prices)
            {
                part(RoomPrices; "Prices")
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        modify(ItemActionGroup) { Visible = admin; }
        modify(PricesandDiscounts) { Visible = admin; }
        modify("Set Special Prices") { Visible = admin; }
        modify(RequestApproval) { Visible = admin; }
        modify(Workflow) { Visible = admin; }
        modify(PurchPricesandDiscounts) { Visible = admin; }
        modify("Item &Tracking Entries") { Visible = admin; }
        modify("Item Journal") { Visible = admin; }
        modify(Action5) { Visible = admin; }
        modify("Item Reclassification Journal") { Visible = admin; }
        modify(History) { Visible = admin; }

        addafter(ItemActionGroup)
        {
            group(Travel)
            {
                Caption = 'Travel';
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

                        Reservation."Hotel No." := Rec."No.";
                        Reservation."Hotel Name" := Rec.Description;
                        Reservation."Hotel Address" := Rec."Hotel Address";
                        Reservation.Destination := Rec.City + ', ' + Rec.Country;
                        Reservation.Insert(true);
                        Page.Run(50312, Reservation);
                    end;
                }
                action(GenerateRoom)
                {
                    Caption = 'Generate rooms';
                    Image = ItemGroup;
                    RunObject = Codeunit RoomGenerator;
                    ToolTip = 'Executes the Generate rooms action.';
                    Visible = admin;
                    Promoted = true;
                    PromotedCategory = Process;
                }
                action(Rooms)
                {
                    RunObject = Page "Room List";
                    Image = Item;
                    RunPageLink = "Hotel Entry No." = field("No.");
                    ToolTip = 'Executes the Rooms action.';
                    Visible = admin;
                    Promoted = true;
                    PromotedCategory = Process;
                }
                action(SendHotel)
                {
                    Caption = 'Send Hotel information';
                    Image = SendTo;
                    ToolTip = 'Executes the action to send hotel information to partner.';
                    Visible = admin;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    var
                        SendHotel: Codeunit SendHotel;
                    begin
                        SendHotel.Run(Rec);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        Customer: Record Customer;
        LoginManagement: Codeunit "Login Management";
    begin
        if LoginManagement.GetCurrentLogin()."User Name" = 'admin' then begin
            admin := true;
        end
        else begin
            admin := false;
            Editable := false;
        end;
    end;

    var
        admin: Boolean;
}