table 50301 "Tracking Reservations"
{
    Caption = 'Tracking Reservations';
    DataClassification = ToBeClassified;

    fields
    {
        field(6; No; Integer)
        {
            DataClassification = AccountData;
            AutoIncrement = true;
        }
        field(1; "Hotel No."; Integer)
        {
            Caption = 'Hotel No.';
            DataClassification = AccountData;
            TableRelation = Hotel."No.";
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = AccountData;
            TableRelation = Customer."No.";
        }
        field(3; "Room No."; Integer)
        {
            Caption = 'Room No.';
            DataClassification = AccountData;
            TableRelation = Room."No." where("Hotel Entry No." = field("Hotel No."));
        }
        field(4; "Room Type"; Enum "Room Type")
        {
            Caption = 'Room Type';
            FieldClass = FlowField;
            CalcFormula = lookup(Room.Type where("Hotel Entry No." = field("Hotel No."), "No." = field("Room No.")));

        }
        field(5; "Reservation Date"; Date)
        {
            Caption = 'Date';
            DataClassification = AccountData;
        }
    }
    keys
    {
        key(PK; "No")
        {
            Clustered = true;
        }
    }

    procedure CheckFreeRoom(Reservation: Record Reservation): Boolean;
    var
        Room: Record Room;
    begin
        Room.SetRange("Hotel Entry No.", Reservation."Hotel No.");
        Room.SetRange(Type, Reservation."Room Type");
        if Room.FindSet() then
            repeat
                Rec.SetRange("Hotel No.", Reservation."Hotel No.");
                Rec.SetRange("Room No.", Room."No.");
                Rec.SetRange("Reservation Date", Reservation."Starting Date", Reservation."Ending Date");
                if Rec.Count() = 0 then
                    exit(true);
            until Room.Next() = 0;
        exit(false);
    end;
}
