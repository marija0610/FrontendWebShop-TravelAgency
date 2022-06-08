table 50305 "Room"
{
    Caption = 'Room';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Hotel Entry No."; Integer)
        {
            Caption = 'Hotel Entry No.';
            DataClassification = AccountData;
        }
        field(2; "No."; Integer)
        {
            Caption = 'No.';
            DataClassification = AccountData;
        }
        field(4; Type; Enum "Room Type")
        {
            Caption = 'Type';
            DataClassification = AccountData;
        }

        field(3; Floor; Integer)
        {
            Caption = 'Floor';
            DataClassification = AccountData;
        }

        field(5; Free; Boolean)
        {
            Caption = 'Free';
            DataClassification = AccountData;
        }
    }
    keys
    {
        key(PK; "Hotel Entry No.", "No.")
        {
            Clustered = true;
        }
    }
}
