table 50308 "Login"
{
    Caption = 'Login';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Id; Integer)
        {
            Caption = 'Id';
            DataClassification = AccountData;
            AutoIncrement = true;
        }
        field(2; "User Name"; Text[250])
        {
            Caption = 'User Name';
            DataClassification = EndUserIdentifiableInformation;

            trigger OnValidate()
            begin
                Rec.TestField("User Name");
            end;
        }
        field(3; Password; Text[100])
        {
            Caption = 'Password';
            DataClassification = EndUserIdentifiableInformation;
        }

        field(5; "E-Mail"; Text[100])
        {
            Caption = 'E-Mail';
            DataClassification = EndUserIdentifiableInformation;
        }

        field(6; "Name"; Text[100])
        {
            Caption = 'Name';
            DataClassification = EndUserIdentifiableInformation;
        }

    }
    keys
    {
        key(PK; Id)
        {
            Clustered = true;
        }
    }

    local procedure SetUser(UserName: Text): Boolean
    begin
        SetRange(Rec."User Name", UserName);
        exit(FindFirst());
    end;
}
