table 50307 "Reservation"
{
    Caption = 'Reservation';
    DataClassification = ToBeClassified;
    LookupPageId = "Reservation List";
    DataCaptionFields = "No.", "Hotel Name", "Destination";


    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            DataClassification = AccountData;
            AutoIncrement = true;
        }
        field(11; "Arrangement No."; Code[20])
        {
            Caption = 'Arrangement No.';
            DataClassification = AccountData;
        }
        field(2; "Hotel No."; Integer)
        {
            Caption = 'Hotel No.';
            DataClassification = AccountData;
        }
        field(3; "Hotel Name"; Text[100])
        {
            Caption = 'Hotel Name';
            DataClassification = AccountData;
        }
        field(4; "Hotel Address"; Text[150])
        {
            Caption = 'Hotel Address';
            DataClassification = AccountData;
        }
        field(5; Destination; Text[250])
        {
            Caption = 'Destination';
            DataClassification = AccountData;
        }
        field(6; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = AccountData;

            trigger OnValidate()

            begin
                if rec."Starting Date" < Today then
                    Error('Starting date can''t be before today!');
                if rec."Ending Date" <> 0D then
                    CalculateTotalPrice();

            end;
        }
        field(7; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
            DataClassification = AccountData;
            trigger OnValidate()
            //var
            //SalesPrice: Record "Sales Price";
            begin
                if rec."Ending Date" < Today then
                    Error('Ending date can''t be before today!');
                if rec."Starting Date" <> 0D then
                    CalculateTotalPrice();

                // SalesPrice.SetRange(SalesPrice."Item No.", Rec."Arrangement No.");
                // SalesPrice.SetRange(SalesPrice."Variant Code", Format(Rec."Room Type"));
                // SalesPrice.SetFilter(SalesPrice."Starting Date", '<>0D');
                // if SalesPrice.FindSet() then
                //     repeat
                //         if (SalesPrice."Starting Date" <= Rec."Starting Date") and (SalesPrice."Ending Date" >= Rec."Starting Date") and (SalesPrice."Ending Date" >= Rec."Ending Date") then begin
                //             Rec."Unit Price" := SalesPrice."Unit Price";
                //             CalculateTotalPrice()
                //         end;
                //     until SalesPrice.Next() = 0
                // else begin
                //     SalesPrice.Reset();
                //     SalesPrice.SetRange(SalesPrice."Item No.", Rec."Arrangement No.");
                //     SalesPrice.SetRange(SalesPrice."Variant Code", Format(Rec."Room Type"));
                //     if SalesPrice.FindFirst() then begin
                //         Rec."Unit Price" := SalesPrice."Unit Price";
                //         CalculateTotalPrice();
                //     end;
                // end;

            end;
        }
        field(8; "Room Type"; Enum "Room Type")
        {
            Caption = 'Room Type';
            DataClassification = AccountData;

            trigger OnValidate()
            var
                SalesPrice: Record "Sales Price";
            begin
                SalesPrice.SetRange(SalesPrice."Item No.", Rec."Arrangement No.");
                SalesPrice.SetRange(SalesPrice."Variant Code", Format(Rec."Room Type"));
                if SalesPrice.FindFirst() then
                    Rec."Unit Price" := SalesPrice."Unit Price"
                else
                    Error('This hotel doesn''t have that type of room.');
            end;
        }
        field(9; "Unit Price"; Decimal)
        {
            Caption = 'Price per day';
            DataClassification = AccountData;
            Editable = false;
        }

        field(10; "Total Price"; Decimal)
        {
            Caption = 'Total Price';
            DataClassification = AccountData;
            Editable = false;
        }

        /*field(12; "Status"; Enum Status)
        {
            Caption = 'Total Price';
            DataClassification = AccountData;
            Editable = false;
        }*/

        field(13; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = AccountData;
            Editable = false;
        }

        field(14; "Customer Name"; Text[100])
        {
            Caption = 'Name';
            DataClassification = AccountData;
            Editable = false;
        }

        field(15; "E-mail"; Text[80])
        {
            Caption = 'E-Mail';
            DataClassification = AccountData;
            Editable = false;
        }

        /*field(16; "Payment method"; Enum PaymentMethod)
        {
            Caption = 'Paymnet method';
            DataClassification = AccountData;
        }*/

        field(17; "Card payment amount"; Decimal)
        {
            Caption = 'Card payment amount';
            DataClassification = AccountData;

            trigger OnValidate()
            begin
                Rec."Cash payment amount" := Rec."Total Price" - Rec."Card payment amount";
            end;
        }

        field(18; "Cash payment amount"; Decimal)
        {
            Caption = 'Cash payment amount';
            DataClassification = AccountData;
            trigger OnValidate()
            begin
                Rec."Card payment amount" := Rec."Total Price" - Rec."Cash payment amount";
            end;
        }

    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }

        key(SK; "Starting Date")
        { }
    }

    local procedure CalculateTotalPrice()
    var
        NoOfDays: Integer;
    begin
        if (Rec."Starting Date" > Rec."Ending Date") then
            Error('Invalid dates!');
        NoOfDays := Rec."Ending Date" - Rec."Starting Date" + 1;
        Rec."Total Price" := NoOfDays * Rec."Unit Price";
        Rec."Card payment amount" := Rec."Total Price";
    end;

    procedure SetFreeRoomNo(RoomNo: Integer)
    begin
        FreeRoomNo := RoomNo;
    end;

    procedure GetFreeRoomNo(): Integer
    begin
        exit(FreeRoomNo);
    end;

    var
        FreeRoomNo: Integer;
}
