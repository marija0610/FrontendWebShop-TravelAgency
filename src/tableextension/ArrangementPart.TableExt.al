tableextension 50301 "ArrangementPart" extends Item
{
    fields
    {
        field(50300; "Hotel No."; Integer)
        {
            Caption = 'Hotel No.';
            DataClassification = AccountData;
            TableRelation = Hotel;

            trigger OnValidate()
            var
                Hotel: Record Hotel;
                Destination: Record Destination;
            begin
                Hotel.Get(Rec."Hotel No.");
                Rec."Hotel Name" := Hotel.Name;
                Rec."Hotel Address" := Hotel."Address";
                Destination.Get(Hotel."Destination No.");
                Rec.City := Destination.City;
                Rec.Country := Destination.Country;
            end;
        }
        field(50301; "Hotel Name"; Text[100])
        {
            Caption = 'Hotel Name';
            DataClassification = AccountData;
        }
        field(50302; "Hotel Address"; Text[150])
        {
            Caption = 'Hotel Address';
            DataClassification = AccountData;
        }
        field(50303; "City"; Text[100])
        {
            Caption = 'City';
            DataClassification = AccountData;
        }

        field(50304; "Country"; Text[100])
        {
            Caption = 'Country';
            DataClassification = AccountData;
        }
    }
}
