tableextension 50301 "ArrangementPart" extends Item
{
    fields
    {
        // field(50300; "Hotel No."; Integer)
        // {
        //     Caption = 'Hotel No.';
        //     DataClassification = AccountData;
        //     TableRelation = Hotel;

        //     trigger OnValidate()
        //     var
        //         Hotel: Record Hotel;
        //         Destination: Record Destination;
        //     begin
        //         Hotel.Get(Rec."Hotel No.");
        //         Rec."Hotel Name" := Hotel.Name;
        //         Rec."Hotel Address" := Hotel."Address";
        //         Destination.Get(Hotel."Destination No.");
        //         Rec.City := Destination.City;
        //         Rec.Country := Destination.Country;
        //     end;
        // }
        // field(50301; "Hotel Name"; Text[100])
        // {
        //     Caption = 'Hotel Name';
        //     DataClassification = AccountData;
        // }
        field(50304; "Country"; Code[10])
        {
            Caption = 'Country Code';
            DataClassification = CustomerContent;
            ValidateTableRelation = false;
            TableRelation = "Country/Region".Code;
        }
        field(50303; "City"; Text[100])
        {
            Caption = 'City';
            DataClassification = CustomerContent;
            TableRelation = "Post Code".City WHERE("Country/Region Code" = FIELD(Country));
        }
        field(50302; "Hotel Address"; Text[150])
        {
            Caption = 'Hotel Address';
            DataClassification = CustomerContent;
        }
        field(50305; "No. of single rooms"; Integer)
        {
            Caption = 'No. of single rooms';
            DataClassification = CustomerContent;
        }
        field(50306; "No. of double rooms"; Integer)
        {
            Caption = 'No. of double rooms';
            DataClassification = CustomerContent;
        }
        field(50307; "No. of triple rooms"; Integer)
        {
            Caption = 'No. of triple rooms';
            DataClassification = CustomerContent;
        }
        field(50308; "No. of quad rooms"; Integer)
        {
            Caption = 'No. of quad rooms';
            DataClassification = CustomerContent;
        }
    }
}
