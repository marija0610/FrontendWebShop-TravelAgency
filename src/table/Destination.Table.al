table 50303 "Destination"
{
    Caption = 'Destination';
    DataClassification = CustomerContent;
    LookupPageId = "Destination List";

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
            DataClassification = SystemMetadata;
            AutoIncrement = true;
        }
        field(2; Country; Text[100])
        {
            Caption = 'Country';
            DataClassification = CustomerContent;
        }
        field(3; City; Text[100])
        {
            Caption = 'City';
            DataClassification = CustomerContent;
        }

    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }

        key(SK; City) { }

    }
}
